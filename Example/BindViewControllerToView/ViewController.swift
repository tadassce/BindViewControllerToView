//
//  ViewController.swift
//  CellViewController
//
//  Created by Francisco Gonçalves on 12/19/2015.
//  Copyright (c) 2015 Francisco Gonçalves. All rights reserved.
//

import UIKit
import BindViewControllerToView

class ViewController: UIViewController {
	@IBOutlet var helloWorld: UILabel!

  var model: String? {
    didSet {
      helloWorld.text = model
    }
  }

}
