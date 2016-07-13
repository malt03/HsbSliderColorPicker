//
//  HsbSliderView.swift
//  Pods
//
//  Created by Koji Murata on 2016/07/13.
//
//

import UIKit

public protocol HsbSliderViewDelegate {
  func hsbSliderView(hsbSliderView: HsbSliderView, didChangeColor color: UIColor)
}

public class HsbSliderView: UIControl {
  public var delegate: HsbSliderViewDelegate?
  public var color: UIColor {
    get { return mainView.color }
    set { mainView.color = newValue }
  }
  public var hue: CGFloat {
    get { return mainView.hue }
    set { mainView.hue = newValue }
  }
  public var saturation: CGFloat {
    get { return mainView.saturation }
    set { mainView.saturation = newValue }
  }
  public var brightness: CGFloat {
    get { return mainView.brightness }
    set { mainView.brightness = newValue }
  }
  
  public override var enabled: Bool {
    get { return mainView.enabled }
    set { mainView.enabled = newValue }
  }
  
  public override var tintColor: UIColor! {
    get { return mainView.tintColor }
    set { mainView.tintColor = newValue }
  }
  
  private let mainView = HsbSliderMainView.instance()
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }
  
  private func initialize() {
    mainView.didChangeColorHandler = { [weak self] (color) in
      guard let s = self else { return }
      s.delegate?.hsbSliderView(s, didChangeColor: color)
      s.sendActionsForControlEvents(.ValueChanged)
    }
    mainView.frame = bounds
    addSubview(mainView)
    
    let views = ["v": mainView]
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-0-[v]-0-|", options: [], metrics: nil, views: views))
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v]-0-|", options: [], metrics: nil, views: views))
    updateConstraintsIfNeeded()
  }
}
