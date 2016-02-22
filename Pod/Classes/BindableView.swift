//
//  BindableView.swift
//  Pods
//
//  Created by Francisco Gonçalves on 21/12/15.
//
//

import UIKit

private var bindableViewControllerKey: UInt8 = 0
private var _parentViewController: UIViewController? = nil

public protocol BindableView: class {
  typealias E

  func instantiateViewController() -> E?
  func layoutViewController()
}

public extension BindableView where Self: UIView, E: UIViewController {
  public var viewController: E? {
    get {
      return objc_getAssociatedObject(self, &bindableViewControllerKey) as? E
    }
    set {
      bv_removeViewController()
      objc_setAssociatedObject(self, &bindableViewControllerKey, newValue,
        objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  public var parentViewController: UIViewController? {
    get {
      return _parentViewController
    }
    set {
      _parentViewController = newValue
      bv_addViewController()
    }
  }

  private func bv_removeViewController() {
    guard let viewController = viewController else {
      return
    }

    viewController.willMoveToParentViewController(nil)
    viewController.view.removeFromSuperview()
    viewController.didMoveToParentViewController(nil)
  }

  private func bv_addViewController() {
    guard let viewController = viewController else {
      return
    }

    viewController.willMoveToParentViewController(parentViewController)
    parentViewController?.addChildViewController(viewController)
    addSubview(viewController.view)
    viewController.view.translatesAutoresizingMaskIntoConstraints = false

    layoutViewController()

    viewController.didMoveToParentViewController(parentViewController)

  }

  public func layoutViewController() {
    guard let viewController = viewController else {
      return
    }

    let views = ["viewControllerView" : viewController.view]
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[viewControllerView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[viewControllerView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views))
  }
}
