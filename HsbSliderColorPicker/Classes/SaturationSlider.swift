//
//  SaturationSlider.swift
//  Hoge
//
//  Created by Koji Murata on 2016/07/13.
//  Copyright © 2016年 Koji Murata. All rights reserved.
//

import UIKit

final class SaturationSlider: GradientSlider {
  var hue = CGFloat(1) {
    didSet { setNeedsDisplay() }
  }
  var brightness = CGFloat(1) {
    didSet { setNeedsDisplay() }
  }
  
  override var colors: [UIColor] {
    get {
      return [
        UIColor(hue: hue, saturation: 0, brightness: brightness, alpha: 1),
        UIColor(hue: hue, saturation: 1, brightness: brightness, alpha: 1),
      ]
    }
  }
}
