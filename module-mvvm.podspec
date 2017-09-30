Pod::Spec.new do |s|

s.name         = "module-mvvm"
s.version      = "0.0.1"
s.summary      = "network"
s.homepage     = "https://github.com/J-yezi/JSPhotoPicker"
s.license      = "MIT"
s.author       = { "J-yezi" => "yehao1020@gmail.com" }
s.source       = { :git => "https://github.com/J-yezi/JSPhotoPicker.git", :tag => s.version }


s.platform     = :ios, "8.0"
s.source_files  = "module-mvvm/**/*.{swift,h,m}"
s.frameworks = "UIKit", "Foundation"

end
