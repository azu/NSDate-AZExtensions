Pod::Spec.new do |s|
  s.name     = 'NSDate-AZExtensions'
  s.version  = '0.0.1'
  s.license  = 'BSD'
  s.summary  = 'Practical real-world dates. - fork of NSDate-Extensions'
  s.homepage = 'http://ericasadun.com'
  s.author   = { 'azu' => 'azuciao@gmail.com' }
  s.source   = { :git => 'https://github.com/azu/NSDate-AZExtensions.git' }
  s.platform = :ios  
  s.source_files = 'NSDate-AZExtensions/NSDate-AZExtensions/NSDate-AZUtilities.{h,m}'
  s.framework = 'Foundation'
end
