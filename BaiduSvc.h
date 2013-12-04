//
//  BaiduSvc.h
//  BaiduMapTest1
//
//  Created by carlos on 13-12-4.
//  Copyright (c) 2013年 carlosk. All rights reserved.
//封装的一个服务类

#import <Foundation/Foundation.h>
#import "BMapKit.h"
@interface BaiduSvc : NSObject
//用百度key启动这个服务
+ (void) startService:(NSString *)baiduKey;
//开始定位
+ (void)startLocaltion;
//获取定位信息
+ (CLLocationCoordinate2D)localtion;
@end
