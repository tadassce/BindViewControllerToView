//
//  BindableView.swift
//  Pods
//
//  Created by Francisco Gonçalves on 21/12/15.
//
//

import UIKit

public protocol BindableView {

	var viewController: BindableViewController? { get set }

	func bind(viewControllerType viewControllerType: BindableViewController.Type, toView view: UIView) -> UIViewController?
	func bind(toViewModel viewModel: BindableViewModel)

}

public extension BindableView {

	func bind(viewControllerType type: BindableViewController.Type, toView view: UIView) -> UIViewController? {
		return helperBind(viewControllerType: type, toView: view)
	}

	func bind(toViewModel viewModel: BindableViewModel) {
		viewController?.bind(viewModel: viewModel)
	}

	internal func helperBind(viewControllerType type: BindableViewController.Type, toView view: UIView) -> UIViewController? {
		guard let viewController = type.initViewController() as? UIViewController else {
			return nil
		}

		view.addSubview(viewController.view)

		viewController.view.translatesAutoresizingMaskIntoConstraints = false

		let views = ["viewControllerView" : viewController.view]
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[viewControllerView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[viewControllerView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))

		return viewController
	}
	
}
