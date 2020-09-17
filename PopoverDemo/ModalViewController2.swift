//
//  ModalViewController2.swift
//  PopoverDemo
//
//  Created by Imanou Petit on 17/09/2020.
//  Copyright © 2020 Imanou Petit. All rights reserved.
//


import UIKit
import Combine

/*
 A table view controller that has a red background.
 When presented as a popover, it resizes according to its table view's content size height.
 ⚠️ WIP: Find a way to move tableView's content inside the safe area so that the first cell is not partially cropped
*/
class ModalViewController2: UITableViewController {

    let cellViewModels = [
        MenuCellViewModel(title: "One"),
        MenuCellViewModel(title: "Two"),
    ]
    var observation: NSKeyValueObservation?
    var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
        tableView.backgroundColor = .red

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Alternative: use `UIContentSizeCategoryDidChangeNotification`?
        observation = tableView.observe(\.contentSize, options: [.initial, .new], changeHandler: { [unowned self] (tableView, contenSizeChange) in
            guard let contenSize = contenSizeChange.newValue else { return }
            self.preferredContentSize = CGSize(width: 200, height: contenSize.height - 1) // remove 1 pt so that the last separator is not visible
        })

        // Alternative: use Combine
        /*
        cancellable = tableView
            .publisher(for: \.contentSize)
            .sink(receiveValue: { contentSize in
                self.preferredContentSize = CGSize(width: 240, height: contentSize.height - 1) // remove 1 pt so that the last separator is not visible
            })
        */
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
