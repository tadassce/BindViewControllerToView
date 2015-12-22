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

	var viewModel: ViewModel? {
		didSet {
			helloWorld.text = viewModel?.helloWorld
		}
	}

}

extension ViewController: BindableViewController {

	static func initViewController() -> BindableViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewControllerWithIdentifier("ViewC") as! ViewController
		return vc
	}

	func bind(viewModel viewModel: BindableViewModel) {
		guard let viewModel = viewModel as? ViewModel else {
			return
		}

		self.viewModel = viewModel
	}
	
}