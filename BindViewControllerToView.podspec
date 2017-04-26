#
# Be sure to run `pod lib lint BindViewControllerToView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BindViewControllerToView"
  s.version          = "0.3.0"
	s.summary          = "Easily embed any ViewController in a Collection/Table View Cell."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
"This library allows you to embed any ViewController in any view."
"Its main purpose is to allow embeding View Controllers in Cells by providing Collection/TableViewCell base classes that you can extend."
                       DESC

  s.homepage         = "https://github.com/franciscocgoncalves/BindViewControllerToView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Francisco Gonçalves" => "franciscocgoncalves@gmail.com" }
  s.source           = { :git => "https://github.com/franciscocgoncalves/BindViewControllerToView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/franciscocsg'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'BindViewControllerToView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.libraries = 'xml2'
  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2'
  }
end
