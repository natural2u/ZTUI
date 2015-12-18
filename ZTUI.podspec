Pod::Spec.new do |s|
  s.name     = 'ZTUI'
  s.version  = '1.0.5'
  s.license  = { :type => "MIT", :file => "FILE_LICENSE" }
  s.summary  = 'Core'
  s.homepage = 'https://gitlab.com/zt/ztui'
  #s.social_media_url = 'https://xx'
  s.authors  = { 'mapengzhen' => 'mpz129@sina.com' }
  s.source   = { :git => 'https://gitlab.com/zt/ztui.git', :tag => s.version }
  s.requires_arc = true

  s.ios.deployment_target = '6.0'
  s.dependency 'ZTCore'
  s.dependency 'ZTNetwork'

  s.public_header_files = 'ZTUI/**/*.h'
  s.source_files =  "ZTUI", "ZTUI/**/*.{h,m}"
  s.resources = ["ZTUI/**/*.png", "ZTUI/**/*.{xib,storyboard,xcdatamodeld,xcdatamodel,txt,plist,cer,html}"]

  s.frameworks = 'CoreGraphics', 'Foundation', 'UIKit'
end
