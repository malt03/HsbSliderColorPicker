//
//  HueSlider.swift
//  Hoge
//
//  Created by Koji Murata on 2016/07/13.
//  Copyright © 2016年 Koji Murata. All rights reserved.
//

import UIKit

final class HueSlider: GradientSlider {
  var saturation = CGFloat(1) {
    didSet { setNeedsDisplay() }
  }
  var brightness = CGFloat(1) {
    didSet { setNeedsDisplay() }
  }
  
  override var colors: [UIColor] {
    get {
      var c = [UIColor]()
      for i in 0...10 {
        c.append(UIColor(hue: CGFloat(i) / 10, saturation: saturation, brightness: brightness, alpha: 1))
      }
      return c
    }
  }
}
