
# CoolSwitchControls
CocoaPod library written in Swift version 5 for iOS 13 and above.

## Introduction

`CoolSwitchControls` offers three types of switch controls. You may configure these switches by adjusting the size, cornerRadius, font, fontSize, add labels, images, and gradient colors.


![Switches](https://user-images.githubusercontent.com/35051980/125172463-85fd5380-e17f-11eb-83e8-d499c9c24f64.gif)


## Installation

### Cocoapods

[Cocoapods](https://cocoapods.org/#install) is a dependency manager for Swift and Objective-C Cocoa projects. To use CoolSwitchControls with CocoaPods, add it in your `Podfile`.

```ruby
pod 'CoolSwitchControls'
```

## Usage

import `CoolSwitchControls`.

```swift
import CoolSwitchControls
```

### Initialization

By coding, create a var of type `CoolSwitchControls` and initialize it

or  by storyboard, changing class of any `UIView` to `CoolSwitchControls`.

Then, you can pass certain information as initialization part.

Make sure to pass the ViewController as parent to the SwitchControl when you initialize it.

```swift
var coolSwitchControls = CoolSwitchControls(parent: self)
```

```swift
CoolSwitchControls.selected = 0
CoolSwitchControls.cornerRadius = 10
CoolSwitchControls.knobCornerRadius = 10
```

This module comes with two protocols that you need to pass to the ViewController:
CoolSwitchControlsDataSource, CoolSwitchControlsDelegate

You can find more information about the usage of these two protocols inside the SampleApp.


## License

The MIT License (MIT)

Copyright (c) 2021 Ian Cooper [@neuralsilicon](https://twitter.com/neuralsilicon)
