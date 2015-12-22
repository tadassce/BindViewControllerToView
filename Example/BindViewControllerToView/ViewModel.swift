//
//  ViewModel.swift
//  CellViewController
//
//  Created by Francisco Gonçalves on 19/12/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import BindViewControllerToView

struct ViewModel: BindableViewModel {
	var helloWorld = "Hello World!"
}

struct ViewModelCollection {
	var viewModels = [ViewModel]()

	init() {
		for _ in 0..<40 {
			self.viewModels.append(ViewModel())
		}
	}

}