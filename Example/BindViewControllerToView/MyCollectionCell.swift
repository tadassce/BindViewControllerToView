//
//  MyCollectionCell.swift
//  BindViewControllerToView
//
//  Created by Francisco Gonçalves on 21/12/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import BindViewControllerToView

class MyCollectionCell: ViewControllerCollectionCell<ViewController> {
  override func instantiateViewController() -> ViewController? {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewControllerWithIdentifier("ViewC") as! ViewController
    return vc
  }
}
