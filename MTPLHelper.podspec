Pod::Spec.new do |s|
s.platform = :ios
s.ios.deployment_target = '11.1'
s.name             = 'MTPLHelper'
s.version          = '0.0.1'
s.summary          = 'A summary to MTPLHelper.'
s.license = { :type => "MIT", :file => "LICENSE" }

s.description      = <<-DESC
MTPLHelper are the pods that provides the basic structure of Moweb Technology
DESC

s.homepage         = 'https://github.com/MowebTechnology/MTPLHelper'

s.framework = "UIKit"
s.dependency 'ReachabilitySwift'

s.authors          = { 'iOS Moweb' => 'projects@moweb.com' }
s.source           = { :git => 'https://github.com/MowebTechnology/MTPLHelper.git', :tag => s.version.to_s }

s.source_files = "SOURCE/MTPLHelper.zip"

s.swift_version = "5"
end





