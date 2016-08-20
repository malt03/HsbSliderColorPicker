//
//  GradientSlider.swift
//  Hoge
//
//  Created by Koji Murata on 2016/07/13.
//  Copyright © 2016年 Koji Murata. All rights reserved.
//

import UIKit

class GradientSlider: UISlider {
  var colors: [UIColor] {
    get { return [] }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }
  
  fileprivate func initialize() {
    maximumTrackTintColor = .clear
    minimumTrackTintColor = .clear
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    guard let c = UIGraphicsGetCurrentContext() else { return }
    let s = CGColorSpaceCreateDeviceRGB()
    
    let maxPointIndex = colors.count - 1
    let locations = (0...maxPointIndex).map { CGFloat($0) / CGFloat(maxPointIndex) }
    let cgColors = colors.map { $0.cgColor }
    
    let clipRect = CGRect(x: rect.height / 2, y: rect.height / 4, width: rect.width - rect.height, height: rect.height / 2)
    c.addPath(CGPath(rect: clipRect, transform: nil))
    c.clip()
    let gradient = CGGradient(colorsSpace: s, colors: cgColors as CFArray, locations: locations)
    c.drawLinearGradient(gradient!, start: CGPoint(x: rect.height / 2, y: 0), end: CGPoint(x: rect.width - rect.height / 2, y: 0), options: [])
    
    UIColor.white.setStroke()
    c.setLineWidth(1)
    c.stroke(clipRect)
  }
  
  override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    return true
  }
}
