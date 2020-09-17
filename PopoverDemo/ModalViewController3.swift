//
//  ModalViewController3.swift
//  PopoverDemo
//
//  Created by Imanou Petit on 17/09/2020.
//  Copyright © 2020 Imanou Petit. All rights reserved.
//

import UIKit

class EmbeddedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let magentaView = UIView()
        magentaView.backgroundColor = .magenta

        view.addSubview(magentaView)
        magentaView.translatesAutoresizingMaskIntoConstraints = false

        let widthConstraint = magentaView.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = magentaView.heightAnchor.constraint(equalToConstant: 100)
        let topConstraint = magentaView.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint = magentaView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let centerXConstraint = magentaView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerYConstraint = magentaView.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            topConstraint,
            leadingConstraint,
            centerXConstraint,
            centerYConstraint,
        ])
    }

}

/*
 A controller that has a red background and embeds a magenta background child view controller.
 When presented as a popover, it resizes according to the Auto Layout constraints set for the green child view controller's view.

 */
class ModalViewController3: UIViewController {

    let embeddedViewController: EmbeddedViewController

    init(with embeddedViewController: EmbeddedViewController) {
        self.embeddedViewController = embeddedViewController

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        addChild(embeddedViewController)
        view.addSubview(embeddedViewController.view)

        embeddedViewController.view.translatesAutoresizingMaskIntoConstraints = false

        // Use safeAreaLayoutGuide to prevent embedded controller to be partially clipped by the popover's arrow
        // Use UILayoutPriority to prevent Auto Layout broken constraints warnings
        let topConstraint = embeddedViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = embeddedViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = embeddedViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let bottomConstraint = embeddedViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        trailingConstraint.priority = UILayoutPriority.defaultHigh
        bottomConstraint.priority = UILayoutPriority.defaultHigh

        NSLayoutConstraint.activate([
            topConstraint,
            leadingConstraint,
            trailingConstraint,
            bottomConstraint,
        ])

        preferredContentSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)

        embeddedViewController.didMove(toParent: self)
    }

}
