//
//  ViewControllerTableCell.swift
//  Pods
//
//  Created by Francisco Gonçalves on 21/12/15.
//
//

import UIKit

public class ViewControllerTableCell<T: BindableViewController>: UITableViewCell, BindableView {

	public var viewController: BindableViewController?

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		viewController = bind(viewControllerType: T.self, toView: contentView) as? BindableViewController

	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		viewController = bind(viewControllerType: T.self, toView: contentView) as? BindableViewController
		
	}

	/*
	Subclasses won't be able to redifine this method unless the following hack is done.
	See more here: http://stackoverflow.com/questions/31795158/swift-2-protocol-extension-not-calling-overriden-method-correctly
	*/
	public func bind(viewControllerType type: BindableViewController.Type, toView view: UIView) -> UIViewController? {
		return helperBind(viewControllerType: type, toView: view)
	}

}
