//
//  TableViewController.swift
//  CellViewController
//
//  Created by Francisco Gonçalves on 21/12/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import BindViewControllerToView

private let reuseIdentifier = "Cell"

class TableViewController: UITableViewController {

	var viewModelCollection = ViewModelCollection()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.registerClass(ViewControllerTableCell<ViewController>.self, forCellReuseIdentifier: reuseIdentifier)
	}
}

// MARK: - Table view data source
extension TableViewController {
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModelCollection.viewModels.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)

		if let cell = cell as? ViewControllerTableCell<ViewController> {
			viewModelCollection.viewModels[indexPath.item].helloWorld += "\(indexPath.item)"
			cell.bind(toViewModel: viewModelCollection.viewModels[indexPath.item])
		}

		return cell
	}
}