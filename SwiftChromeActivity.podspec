#
# Be sure to run `pod lib lint SwiftChromeActivity.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SwiftChromeActivity"
  s.version          = "0.1.0"
  s.summary          = "The easiest way to share url in Chrome."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/fewspider/SwiftChromeActivity"
  s.screenshots     = "https://farm1.staticflickr.com/769/20942373976_ff6c4f32eb_z.jpg", "https://farm1.staticflickr.com/726/20346033874_517f21f4dd_z.jpg"
  s.license          = 'MIT'
  s.author           = { "fewspider" => "fewspider@gmail.com" }
  s.source           = { :git => "https://github.com/fewspider/SwiftChromeActivity.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fewspider'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SwiftChromeActivity' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
