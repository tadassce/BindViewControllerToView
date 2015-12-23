	//
//  ViewControllerCollectionCell.swift
//  Pods
//
//  Created by Francisco Gonçalves on 21/12/15.
//
//

import UIKit

public class ViewControllerCollectionCell<E: UIViewController>: UICollectionViewCell, BindableView {

  public func instantiateViewController() -> E? {
    fatalError("instantiateViewController() must be overriden in ViewControllerCollectionCell subclass")
  }
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		viewController = instantiateViewController()

	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

    viewController = instantiateViewController()

	}

}