Pod::Spec.new do |s|
  s.name         = 'VerifyCode'
  s.version      = '3.2.2'
  s.summary      = "VerifyCode iOS SDK"
  s.description  = "iOS framework for VerifyCode Service"
  s.homepage     = 'http://dun.163.com/product/captcha'
  s.authors      = { 'apksafe' => 'apksafe@163.com' }
  s.license      = { :type => 'Free', :text => "©2017 dun.163.com" }
  s.source       = { :git => "https://github.com/apksafe/VerifyCode-iOS.git", :tag => 'v3.2.2' }
  s.requires_arc = true
  s.platform     = :ios
  s.vendored_frameworks ='Release/VerifyCode.framework'
  s.resource     = "Resources/NTESVerifyCodeResources.bundle"
  s.ios.deployment_target = "9.0"
  s.frameworks = 'QuartzCore','CoreFoundation','Security','CoreGraphics','UIKit','Foundation','SystemConfiguration','WebKit','JavaScriptCore'
  s.library = 'c++','z'
  end
