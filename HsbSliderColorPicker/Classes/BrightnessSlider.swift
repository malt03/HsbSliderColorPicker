//
//  BrightnessSlider.swift
//  Hoge
//
//  Created by Koji Murata on 2016/07/13.
//  Copyright © 2016年 Koji Murata. All rights reserved.
//

import UIKit

final class BrightnessSlider: GradientSlider {
  var hue = CGFloat(1) {
    didSet { setNeedsDisplay() }
  }
  var saturation = CGFloat(1) {
    didSet { setNeedsDisplay() }
  }
  
  override var colors: [UIColor] {
    get {
      return [
        UIColor(hue: hue, saturation: saturation, brightness: 0, alpha: 1),
        UIColor(hue: hue, saturation: saturation, brightness: 1, alpha: 1),
      ]
    }
  }
}
