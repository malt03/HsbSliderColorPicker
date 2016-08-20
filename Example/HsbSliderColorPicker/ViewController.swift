//
//  ViewController.swift
//  HsbSliderColorPicker
//
//  Created by Koji Murata on 07/13/2016.
//  Copyright (c) 2016 Koji Murata. All rights reserved.
//

import UIKit
import HsbSliderColorPicker

class ViewController: UIViewController, HsbSliderViewDelegate {
  
  @IBOutlet fileprivate weak var hsbSliderView: HsbSliderView! {
    didSet {
      hsbSliderView.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hsbSliderView.color = view.backgroundColor!
  }
  
  @IBAction fileprivate func changeColor(_ sender: HsbSliderView) {
    view.backgroundColor = sender.color
  }
  
  func hsbSliderView(_ hsbSliderView: HsbSliderView, didChangeColor color: UIColor) {
    print(color)
  }
}
