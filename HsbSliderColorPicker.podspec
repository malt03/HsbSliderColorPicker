#
# Be sure to run `pod lib lint HsbSliderColorPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HsbSliderColorPicker'
  s.version          = '0.1.0'
  s.summary          = 'Simple color picker with hsb.'

  s.description      = <<-DESC
This pod is to create a color picker with sliders for hsb.
                       DESC

  s.homepage         = 'https://github.com/malt03/HsbSliderColorPicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Koji Murata' => 'koji.murata@dena.com' }
  s.source           = { :git => 'https://github.com/malt03/HsbSliderColorPicker.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'HsbSliderColorPicker/Classes/**/*'
  
  s.resource_bundles = {
    'HsbSliderColorPicker' => ['HsbSliderColorPicker/Resources/*']
  }
end
