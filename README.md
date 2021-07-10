
# CoolSwitchControls
CocoaPod library written in Swift version 5 for iOS 13 and above.

## Introduction

`CoolSwitchControls` is a pie and bar chart that includes selections and animations.


![Switches](https://user-images.githubusercontent.com/35051980/125172463-85fd5380-e17f-11eb-83e8-d499c9c24f64.gif)


## Installation

### Cocoapods

[Cocoapods](https://cocoapods.org/#install) is a dependency manager for Swift and Objective-C Cocoa projects. To use PieBarChart with CocoaPods, add it in your `Podfile`.

```ruby
pod 'PieBarChart'
```

## Usage

import `PieBarChart`.

```swift
import PieBarChart
```

### Initialization

By coding, create a var of type `PieBarChart` and initialize it

or  by storyboard, changing class of any `UIView` to `PieBarChart`.

Then, you are going to need to add values to ChartData, it's a struct with name, data, and color.


```swift
PieBarChart().addChart(chart: .Pie, data: chartData, orientation: orientation)
```

orientation is only for Pie Chart and comes with default vertical value.


## License

The MIT License (MIT)

Copyright (c) 2021 Ian Cooper [@neuralsilicon](https://twitter.com/neuralsilicon)
