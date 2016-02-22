//
//  ViewControllerTableCell.swift
//  Pods
//
//  Created by Francisco Gonçalves on 21/12/15.
//
//

import UIKit

public class ViewControllerTableCell<E: UIViewController>: UITableViewCell, BindableView {

  public func instantiateViewController() -> E? {
    fatalError("instantiateViewController() must be overriden in ViewControllerCollectionCell subclass")
  }

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    viewController = instantiateViewController()

  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    viewController = instantiateViewController()
    
  }
}
