//
//  BaiduSvc.m
//  BaiduMapTest1
//
//  Created by carlos on 13-12-4.
//  Copyright (c) 2013年 carlosk. All rights reserved.
//

#import "BaiduSvc.h"

@interface BaiduSvc()<BMKMapViewDelegate>
@property(nonatomic,assign)CLLocationCoordinate2D  localtion;//定位
@end
@implementation BaiduSvc

static BMKMapView *mapView;
static BMKMapManager *mapManager;
static BaiduSvc *baiduSvc;

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baiduSvc = [[BaiduSvc alloc]init];
    });
}
//用百度key启动这个服务
+ (void) startService:(NSString *)baiduKey{
    [baiduSvc inStartService:baiduKey];
}
//开始定位
+ (void)startLocaltion{
    mapView.showsUserLocation = YES;
}

+ (CLLocationCoordinate2D)localtion{
    return  baiduSvc.localtion;
}

- (void)inStartService:(NSString *)baiduKey{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mapManager = [[BMKMapManager alloc] init];
        BOOL ret = [mapManager start:baiduKey generalDelegate:nil];
        if (!ret) {
            NSLog(@"百度地图启动失败 failed!");
        } else {
            NSLog(@"百度地图启动成功 succeed!");
            mapView = [[BMKMapView alloc]init];
            mapView.delegate = self;

        }
        
    });

}

/**
 *用户位置更新后，会调用此函数
 *@param mapView 地图View
 *@param userLocation 新的用户位置
 */
- (void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation{
    NSLog(@"%f,%f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    self.localtion = userLocation.coordinate;
    mapView.showsUserLocation = NO;
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(BMKMapView *)mapView didFailToLocateUserWithError:(NSError *)error{
    
}

@end
