//
//  ModalViewController1.swift
//  PopoverDemo
//
//  Created by Imanou Petit on 17/09/2020.
//  Copyright © 2020 Imanou Petit. All rights reserved.
//

import UIKit

/*
 A controller that has a red background view which containts a green background subview.
 When presented as a popover, it resizes according to the Auto Layout constraints set for the green subview.
 */
class ModalViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(greenView)

        // Use safeAreaLayoutGuide to prevent greenView to be partially clipped by the popover's arrow
        // Use UILayoutPriority to prevent Auto Layout broken constraints warnings
        let widthConstraint = greenView.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = greenView.heightAnchor.constraint(equalToConstant: 100)
        let topConstraint = greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = greenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let centerXConstraint = greenView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        let centerYConstraint = greenView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        widthConstraint.priority = UILayoutPriority.defaultHigh
        heightConstraint.priority = UILayoutPriority.defaultHigh

        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            topConstraint,
            leadingConstraint,
            centerXConstraint,
            centerYConstraint,
        ])

        preferredContentSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }

}
