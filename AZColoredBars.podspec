Pod::Spec.new do |s|
  s.name         = "AZColoredBars"
  s.version      = "0.0.4"
  s.summary      = "A UINavigationBar and UIToolbar subclass for strong colored navigation bars on iOS 7."
  s.description  = <<-DESC
				   A drop–in `UINavigationBar` and `UIToolbar` subclass which allows for strong coloured navigation bars on iOS 7. Use with UINavigationController's initWithNavigationBarClass:toolbarClass: method.

				   Thanks to @steventroughtonsmith for the original help as seen in this [gist](https://gist.github.com/alanzeino/6619253). Forked from @aprato's modification [here](https://gist.github.com/aprato/6631390).
                   DESC

  s.homepage     = "https://github.com/spookd/AZColoredBars"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Alan Zeino" => "alan.zeino@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/spookd/AZColoredBars.git", :tag => "0.0.4" }
  s.source_files  = 'AZColoredBars'
  s.requires_arc = true
end
