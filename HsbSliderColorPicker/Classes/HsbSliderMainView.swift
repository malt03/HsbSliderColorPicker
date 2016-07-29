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
    set { sliders.forEach { $0.enabled = newValue } }
    get { return hueSlider.enabled }
  }
  
  override var tintColor: UIColor! {
    set {
      super.tintColor = newValue
      sliders.forEach { $0.tintColor = newValue }
    }
    get { return super.tintColor }
  }

  var didChangeColorHandler: ((color: UIColor) -> Void)?
  private var handlerEnabled = true
  
  @IBOutlet private weak var hueSlider: HueSlider!
  @IBOutlet private weak var saturationSlider: SaturationSlider!
  @IBOutlet private weak var brightnessSlider: BrightnessSlider!
  
  private var sliders: [UISlider] {
    return [hueSlider, saturationSlider, brightnessSlider]
  }
  
  @IBAction private func hueChanged() {
    saturationSlider.hue = hue
    brightnessSlider.hue = hue
    colorChanged()
  }
  
  @IBAction private func saturationChanged() {
    hueSlider.saturation = saturation
    brightnessSlider.saturation = saturation
    colorChanged()
  }
  
  @IBAction private func brightnessChanged() {
    hueSlider.brightness = brightness
    saturationSlider.brightness = brightness
    colorChanged()
  }
  
  private func colorChanged() {
    if handlerEnabled {
      didChangeColorHandler?(color: color)
    }
  }
  
  static func instance() -> HsbSliderMainView {
    return UINib(nibName: "HsbSliderMainView", bundle: bundle).instantiateWithOwner(self, options: nil).first as! HsbSliderMainView
  }
  
  private static var bundle: NSBundle {
    return NSBundle(path: NSBundle(forClass: HsbSliderMainView.self).pathForResource("HsbSliderColorPicker", ofType: "bundle")!)!
  }
}
