Pod::Spec.new do |s|
  s.name         = "FBGlowView"
  s.version      = "0.0.1"
  s.summary      = "provides glowing effect to your own view class"
  s.description  = <<-DESC
  You can easilty add your view class glowing effect with inheriting this class
                   DESC
  s.homepage      = "https://github.com/lyokato/FBGlowView"
  s.license       = 'MIT'
  s.author        = { "Lyo Kato" => "lyo.kato@gmail.com" }
  s.platform      = :ios, '6.0'
  s.source        = { :git => "https://github.com/lyokato/FBGlowView.git", :tag => "0.0.1" }
  s.source_files  = 'FBGlowView/Classes/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc  = true
end
