Pod::Spec.new do |s|
  s.name           = "MEDCategories"
  s.version        = "1.0"
  s.summary        = "Common categories"
  s.homepage       = "http://www.2359media.com"
  s.author         = '2359 Media'
  s.source         =  { :git => "https://github.com/2359media/MEDCategories.git", :tag => s.version.to_s }
  s.platform       = :ios, '7.0'

  s.license        = { :type => 'MIT', :file => 'LICENSE.md' }

  s.frameworks     = 'UIKit', 'Foundation'
  s.source_files   = 'MEDCategories/*.{h,m}'
  
  s.dependency      'Mantle'
  s.dependency      'Masonry'
end