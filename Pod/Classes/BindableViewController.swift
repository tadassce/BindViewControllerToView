//
//  BindableViewController.swift
//  Pods
//
//  Created by Francisco Gonçalves on 21/12/15.
//
//

import UIKit

public protocol BindableViewController {

	static func initViewController() -> BindableViewController

	func bind(viewModel viewModel: BindableViewModel)
	
}