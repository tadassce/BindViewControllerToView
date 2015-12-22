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
	override func bind(viewControllerType type: BindableViewController.Type, toView view: UIView) -> UIViewController? {
		guard let viewController = type.initViewController() as? UIViewController else {
			return nil
		}

		view.backgroundColor = .redColor()

		view.addSubview(viewController.view)

		viewController.view.translatesAutoresizingMaskIntoConstraints = false

		let views = ["viewControllerView" : viewController.view]
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[viewControllerView]-10-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-50-[viewControllerView]-50-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))

		return viewController
	}

}
