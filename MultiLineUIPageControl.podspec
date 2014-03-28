Pod::Spec.new do |s|
  s.name     = 'MultiLineUIPageControl'
  s.version  = '0.1'
  s.platform = :ios
  s.license  = 'MIT'
  s.summary  = 'UIPageControl with multiple lines.'
  s.homepage = 'http://luizalabs.com'
  s.author   = { 'Bruno Corrêa' => 'bruno@luizalabs.com' }
  s.source   = { 'https://github.com/luizalabs/MultiLineUIPageControl.git', :tag => s.version.to_s }
  s.description = 'UIPageControl with multiple lines, dots vertical and horizontal spacement.'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end