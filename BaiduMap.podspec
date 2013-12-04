Pod::Spec.new do |s|
  s.ios.deployment_target = "5.0"

  s.name         = 'BaiduMap'
  s.version      = '2.0.2'
  s.license      =  { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'http://www.carloschen.cn'
  s.authors      =  { 'carlos' => 'carlosk@163.com' }
  s.summary      = 'Baidu map SDK'
  s.source       =  { :git => 'https://github.com/carlosk/BaiduMap.git'}
  s.requires_arc = true
  s.framework    = 'CoreLocation','QuartzCore','OpenGLES','SystemConfiguration','CoreGraphics'
  s.source_files = "inc/*.h","BaiduSvc.h","BaiduSvc.m"
  s.ios.vendored_library = 'libs/**/*.a'
  s.ios.resource_bundle = { 'mapapi' => 'mapapi.bundle/**/*' }
  s.xcconfig = { 'OTHER_LDFLAGS' => '-lObjC','LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/BaiduMap/libs/Release$(EFFECTIVE_PLATFORM_NAME)' }
  

end
  
