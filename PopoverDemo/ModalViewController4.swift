//
//  ModalViewController4.swift
//  PopoverDemo
//
//  Created by Imanou Petit on 18/09/2020.
//  Copyright © 2020 Imanou Petit. All rights reserved.
//


import UIKit

/*
 A table view controller that has a red background.
 When presented as a popover, it resizes according to its table view's content size height.
 ⚠️ To prevent the cells of this table view controller to be partially outside the safe area (see example #2),
 we embed it in a navigation view controller and hide it's navigation bar
*/
class ModalViewController4: UITableViewController {

    let cellViewModels = [
        MenuCellViewModel(title: "One"),
        MenuCellViewModel(title: "Two"),
    ]
    var observation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)

        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
        tableView.backgroundColor = .red

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        observation = tableView.observe(\.contentSize, options: [.initial, .new], changeHandler: { [unowned self] (tableView, contenSizeChange) in
            guard let contenSize = contenSizeChange.newValue else { return }
            self.preferredContentSize = CGSize(width: 200, height: contenSize.height - 1) // remove 1 pt so that the last separator is not visible
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cellViewModels[indexPath.row].title
        return cell
    }

}
