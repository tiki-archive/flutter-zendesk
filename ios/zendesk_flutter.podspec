#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zendesk_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zendesk_flutter'
  s.version          = '0.0.1'
  s.summary          = 'flutter lib for zendesk api'
  s.homepage         = 'https://mytiki.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'TIKI' => 'hello@mytiki.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZendeskSupportSDK'
  s.dependency 'ZendeskSupportProvidersSDK'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
