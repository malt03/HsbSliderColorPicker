//
//  HsbSliderMainView.swift
//  Pods
//
//  Created by Koji Murata on 2016/07/13.
//
//

import UIKit

final class HsbSliderMainView: UIView {
  var color: UIColor {
    get {
      return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    set {
      handlerEnabled = false
      newValue.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil)
      handlerEnabled = true
    }
  }
  
  var hue: CGFloat {
    get { return CGFloat(hueSlider.value) }
    set {
      hueSlider.value = Float(newValue)
      hueChanged()
    }
  }

  var saturation: CGFloat {
    get { return CGFloat(saturationSlider.value) }
    set {
      saturationSlider.value = Float(newValue)
      saturationChanged()
    }
  }
  
  var brightness: CGFloat {
    get { return CGFloat(brightnessSlider.value) }
    set {
      brightnessSlider.value = Float(newValue)
      brightnessChanged()
    }
  }
  
  var enabled: Bool {
    set { sliders.forEach { $0.isEnabled = newValue } }
    get { return hueSlider.isEnabled }
  }
  
  override var tintColor: UIColor! {
    set {
      super.tintColor = newValue
      sliders.forEach { $0.tintColor = newValue }
    }
    get { return super.tintColor }
  }

  var didChangeColorHandler: ((_ color: UIColor) -> Void)?
  fileprivate var handlerEnabled = true
  
  @IBOutlet fileprivate weak var hueSlider: HueSlider!
  @IBOutlet fileprivate weak var saturationSlider: SaturationSlider!
  @IBOutlet fileprivate weak var brightnessSlider: BrightnessSlider!
  
  fileprivate var sliders: [UISlider] {
    return [hueSlider, saturationSlider, brightnessSlider]
  }
  
  @IBAction fileprivate func hueChanged() {
    saturationSlider.hue = hue
    brightnessSlider.hue = hue
    colorChanged()
  }
  
  @IBAction fileprivate func saturationChanged() {
    hueSlider.saturation = saturation
    brightnessSlider.saturation = saturation
    colorChanged()
  }
  
  @IBAction fileprivate func brightnessChanged() {
    hueSlider.brightness = brightness
    saturationSlider.brightness = brightness
    colorChanged()
  }
  
  fileprivate func colorChanged() {
    if handlerEnabled {
      didChangeColorHandler?(color)
    }
  }
  
  static func instance() -> HsbSliderMainView {
    return UINib(nibName: "HsbSliderMainView", bundle: bundle).instantiate(withOwner: self, options: nil).first as! HsbSliderMainView
  }
  
  fileprivate static var bundle: Bundle {
    return Bundle(path: Bundle(for: HsbSliderMainView.self).path(forResource: "HsbSliderColorPicker", ofType: "bundle")!)!
  }
}
