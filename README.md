# HsbSliderColorPicker

[![Platform](https://img.shields.io/cocoapods/p/HsbSliderColorPicker.svg?style=flat)](http://cocoapods.org/pods/HsbSliderColorPicker)
![Language](https://img.shields.io/badge/language-Swift%202.2-orange.svg)
[![CocoaPods](https://img.shields.io/cocoapods/v/HsbSliderColorPicker.svg?style=flat)](http://cocoapods.org/pods/HsbSliderColorPicker)
![License](https://img.shields.io/github/license/malt03/HsbSliderColorPicker.svg?style=flat)

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
