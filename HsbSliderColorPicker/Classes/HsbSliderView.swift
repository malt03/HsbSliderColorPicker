//
//  HsbSliderView.swift
//  Pods
//
//  Created by Koji Murata on 2016/07/13.
//
//

import UIKit

public protocol HsbSliderViewDelegate {
  func hsbSliderView(_ hsbSliderView: HsbSliderView, didChangeColor color: UIColor)
}

open class HsbSliderView: UIControl {
  open var delegate: HsbSliderViewDelegate?
  open var color: UIColor {
    get { return mainView.color }
    set { mainView.color = newValue }
  }
  open var hue: CGFloat {
    get { return mainView.hue }
    set { mainView.hue = newValue }
  }
  open var saturation: CGFloat {
    get { return mainView.saturation }
    set { mainView.saturation = newValue }
  }
  open var brightness: CGFloat {
    get { return mainView.brightness }
    set { mainView.brightness = newValue }
  }
  
  open override var isEnabled: Bool {
    get { return mainView.enabled }
    set { mainView.enabled = newValue }
  }
  
  open override var tintColor: UIColor! {
    get { return mainView.tintColor }
    set { mainView.tintColor = newValue }
  }
  
  fileprivate let mainView = HsbSliderMainView.instance()
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }
  
  fileprivate func initialize() {
    mainView.didChangeColorHandler = { [weak self] (color) in
      guard let s = self else { return }
      s.delegate?.hsbSliderView(s, didChangeColor: color)
      s.sendActions(for: .valueChanged)
    }
    mainView.frame = bounds
    addSubview(mainView)
    
    let views = ["v": mainView]
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-0-[v]-0-|", options: [], metrics: nil, views: views))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v]-0-|", options: [], metrics: nil, views: views))
    updateConstraintsIfNeeded()
  }
}
