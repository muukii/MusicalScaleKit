
Pod::Spec.new do |s|
  s.name             = "MusicalScaleKit"
  s.version          = "0.1.0"
  s.summary          = "Generate notes on Musical Scale"
  s.description      = <<-DESC
                        Generate notes on Musical Scale.
                        You can get notes. (Set ScaleDegree and Key)
                       DESC

  s.homepage         = "https://github.com/muukii/MusicalScaleKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "muukii" => "m@muukii.me" }
  s.source           = { :git => "https://github.com/muukii/MusicalScaleKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/muukii0803'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MusicalScaleKit/Classes/**/*'
end
