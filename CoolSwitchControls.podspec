Pod::Spec.new do |spec|

  spec.name         = "CoolSwitchControls"
  spec.version      = "0.0.1"
  spec.summary      = "SwitchControl CocoaPods library written in Swift 5"

  spec.description  = <<-DESC
This library gives you three types of switch controls. You can adjust size, cornerRadius, add labels, images and gradient colors.
                   DESC

  spec.homepage     = "https://github.com/NeuralSilicon/CoolSwitchControls"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Ian Cooper" => "Neuralsilicon@gmail.com" }


  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5"

  spec.source       = { :git => "https://github.com/NeuralSilicon/CoolSwitchControls.git", :tag => "#{spec.version}" }
  spec.source_files  = "CoolSwitchControls/**/*.{h,m,swift}"


end