Pod::Spec.new do |s|
s.platform = :ios
s.ios.deployment_target = '11.1'
s.name             = 'MTPLHelper'
s.version          = '0.0.10'
s.summary          = 'A summary to MTPLHelper.'
s.license = { :type => "MIT", :file => "LICENSE" }

s.description      = <<-DESC
MTPLHelper are the pods that provides the basic structure of Moweb Technology
DESC

s.homepage         = 'https://github.com/MowebTechnology/MTPLHelper'

s.framework = "UIKit"
s.dependency 'ReachabilitySwift'
s.dependency 'MTPLGeneral'

s.authors          = { 'iOS Moweb' => 'projects@moweb.com' }
s.source           = { :http => 'https://github.com/MowebTechnology/MTPLHelper/releases/download/0.0.10/MTPLHelper.zip' }

s.ios.vendored_frameworks = 'MTPLHelper.framework'

s.swift_version = "5"
end





