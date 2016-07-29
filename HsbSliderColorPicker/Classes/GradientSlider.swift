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
  
  private func initialize() {
    maximumTrackTintColor = .clearColor()
    minimumTrackTintColor = .clearColor()
  }
  
  override func drawRect(rect: CGRect) {
    super.drawRect(rect)
    
    let c = UIGraphicsGetCurrentContext()
    let s = CGColorSpaceCreateDeviceRGB()
    
    let maxPointIndex = colors.count - 1
    let locations = (0...maxPointIndex).map { CGFloat($0) / CGFloat(maxPointIndex) }
    let cgColors = colors.map { $0.CGColor }
    
    let clipRect = CGRect(x: rect.height / 2, y: rect.height / 4, width: rect.width - rect.height, height: rect.height / 2)
    CGContextAddPath(c, CGPathCreateWithRect(clipRect, nil))
    CGContextClip(c)
    let gradient = CGGradientCreateWithColors(s, cgColors, locations)
    CGContextDrawLinearGradient(c, gradient, CGPoint(x: rect.height / 2, y: 0), CGPoint(x: rect.width - rect.height / 2, y: 0), [])
    
    UIColor.whiteColor().setStroke()
    CGContextSetLineWidth(c, 1)
    CGContextStrokeRect(c, clipRect)
  }
  
  override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
    return true
  }
}
