	//
//  ViewControllerCollectionCell.swift
//  Pods
//
//  Created by Francisco Gonçalves on 21/12/15.
//
//

import UIKit

public class ViewControllerCollectionCell<T: BindableViewController>: UICollectionViewCell, BindableView {

	public var viewController: BindableViewController?
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		viewController = bind(viewControllerType: T.self, toView: contentView) as? BindableViewController

	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		viewController = bind(viewControllerType: T.self, toView: contentView) as? BindableViewController

	}

	/*
	Subclasses won't be able to redifine this method unless the following hack is done.
	See more: http://stackoverflow.com/questions/31795158/swift-2-protocol-extension-not-calling-overriden-method-correctly
						http://stackoverflow.com/questions/33702738/method-customization-in-sub-class-not-called
	*/
	public func bind(viewControllerType type: BindableViewController.Type, toView view: UIView) -> UIViewController? {
		return helperBind(viewControllerType: type, toView: view)
	}

}