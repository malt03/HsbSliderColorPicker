# HsbSliderColorPicker

[![CI Status](http://img.shields.io/travis/Koji Murata/HsbSliderColorPicker.svg?style=flat)](https://travis-ci.org/Koji Murata/HsbSliderColorPicker)
[![Version](https://img.shields.io/cocoapods/v/HsbSliderColorPicker.svg?style=flat)](http://cocoapods.org/pods/HsbSliderColorPicker)
[![License](https://img.shields.io/cocoapods/l/HsbSliderColorPicker.svg?style=flat)](http://cocoapods.org/pods/HsbSliderColorPicker)
[![Platform](https://img.shields.io/cocoapods/p/HsbSliderColorPicker.svg?style=flat)](http://cocoapods.org/pods/HsbSliderColorPicker)

![Screenshot](https://raw.githubusercontent.com/malt03/HsbSliderColorPicker/master/Screenshot.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage
You can set HsbSliderView for UIView on Interface Builder.

```swift
@IBAction private func changeColor(sender: HsbSliderView) {
  // sender.color
}
```

or

```swift
hsbSliderView.delegate = self
func hsbSliderView(hsbSliderView: HsbSliderView, didChangeColor color: UIColor) {
  // color
}
```

## Installation

HsbSliderColorPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HsbSliderColorPicker"
```

## Author

Koji Murata, malt.koji@gmail.com

## License

HsbSliderColorPicker is available under the MIT license. See the LICENSE file for more info.
