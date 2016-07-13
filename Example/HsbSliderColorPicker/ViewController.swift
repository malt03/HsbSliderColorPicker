//
//  ViewController.swift
//  HsbSliderColorPicker
//
//  Created by Koji Murata on 07/13/2016.
//  Copyright (c) 2016 Koji Murata. All rights reserved.
//

import UIKit
import HsbSliderColorPicker

class ViewController: UIViewController {
  
  @IBOutlet private weak var hsbSliderView: HsbSliderView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hsbSliderView.color = view.backgroundColor!
  }
  
  @IBAction private func changeColor(sender: HsbSliderView) {
    view.backgroundColor = sender.color
  }
}
