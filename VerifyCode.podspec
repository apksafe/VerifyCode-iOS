Pod::Spec.new do |s|
  s.name         = 'VerifyCode'
  s.version      = '1.0.3'
  s.summary      = "VerifyCode iOS SDK"
  s.description  = "iOS framework for VerifyCode Service"
  s.homepage     = 'http://dun.163.com/product/captcha?from=baiduP2_YZM_CP6307'
  s.authors      = { 'skylinchen' => 'skylin_baiyi@163.com' }
  s.license      = { :type => 'Free', :text => "©2017 dun.163.com" }
  s.source       = { :http => "https://raw.githubusercontent.com/skylinchen/VerifyCode-iOS/master/Release/VerifyCode_iOS_1.0.3.zip" }
  s.requires_arc = true
  s.platform     = :ios
  s.vendored_frameworks ='VerifyCode.framework'
  s.ios.deployment_target = "7.0"
  s.frameworks = 'SystemConfiguration','WebKit','JavaScriptCore'
  s.library = 'c++','z'
  end
