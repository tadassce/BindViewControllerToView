#
# Be sure to run `pod lib lint BindViewControllerToView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BindViewControllerToView"
  s.version          = "0.2.0"
	s.summary          = "Easily embed any ViewController and its respective ViewModel in a Collection/Table View Cell."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
"The main purpose of this project is to provide a easy way to embed any View Controller to a Collection/Table View Cell."
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
end
