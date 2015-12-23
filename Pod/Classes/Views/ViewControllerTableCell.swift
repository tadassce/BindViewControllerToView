//
//  ViewControllerTableCell.swift
//  Pods
//
//  Created by Francisco Gonçalves on 21/12/15.
//
//

import UIKit

public class ViewControllerTableCell<T: UIViewController>: UITableViewCell, BindableView {

  public typealias ViewController = T

  public var viewController: ViewController?

  public func instantiateViewController() -> ViewController? {
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