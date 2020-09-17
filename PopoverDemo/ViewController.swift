//
//  ViewController.swift
//  PopoverDemo
//
//  Created by Imanou Petit on 17/09/2020.
//  Copyright © 2020 Imanou Petit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonOne = UIButton(type: .system)
        let buttonTwo = UIButton(type: .system)
        let buttonThree = UIButton(type: .system)
        let buttonFour = UIButton(type: .system)
        let buttonFive = UIButton(type: .system)

        buttonOne.setTitle("Show popover #1", for: .normal)
        buttonOne.addTarget(self, action: #selector(presentPopController1(_:)), for: .touchUpInside)

        buttonTwo.setTitle("Show popover #2", for: .normal)
        buttonTwo.addTarget(self, action: #selector(presentPopController2(_:)), for: .touchUpInside)

        buttonThree.setTitle("Show popover #3", for: .normal)
        buttonThree.addTarget(self, action: #selector(presentPopController3(_:)), for: .touchUpInside)

        buttonFour.setTitle("Show popover #4", for: .normal)
        buttonFour.addTarget(self, action: #selector(presentPopController4(_:)), for: .touchUpInside)

        buttonFive.setTitle("Show popover #5", for: .normal)
        buttonFive.addTarget(self, action: #selector(presentPopController5(_:)), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive])
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc func presentPopController1(_ sender: UIButton) {
        let newViewController = ModalViewController1()
        newViewController.modalPresentationStyle = .popover

        let popPresentationController = newViewController.popoverPresentationController
        popPresentationController?.sourceView = sender
        popPresentationController?.sourceRect = sender.bounds
        popPresentationController?.permittedArrowDirections = .any
        popPresentationController?.delegate = self

        present(newViewController, animated: true, completion: nil)
    }

    @objc func presentPopController2(_ sender: UIButton) {
        let newViewController = ModalViewController2()
        newViewController.modalPresentationStyle = .popover

        let popPresentationController = newViewController.popoverPresentationController
        popPresentationController?.sourceView = sender
        popPresentationController?.sourceRect = sender.bounds
        popPresentationController?.permittedArrowDirections = .any
        popPresentationController?.delegate = self

        present(newViewController, animated: true, completion: nil)
    }

    @objc func presentPopController3(_ sender: UIButton) {
        let newViewController = ModalViewController3(with: EmbeddedViewController())
        newViewController.modalPresentationStyle = .popover

        let popPresentationController = newViewController.popoverPresentationController
        popPresentationController?.sourceView = sender
        popPresentationController?.sourceRect = sender.bounds
        popPresentationController?.permittedArrowDirections = .any
        popPresentationController?.delegate = self

        present(newViewController, animated: true, completion: nil)
    }

    @objc func presentPopController4(_ sender: UIButton) {
        /*
         To prevent the cells of ModalViewController4 to be partially outside the safe area (see example #2),
         we embed it in a navigation view controller and hide it's navigation bar.
        */
        let newViewController = UINavigationController(rootViewController: ModalViewController4())
        newViewController.modalPresentationStyle = .popover

        let popPresentationController = newViewController.popoverPresentationController
        popPresentationController?.sourceView = sender
        popPresentationController?.sourceRect = sender.bounds
        popPresentationController?.permittedArrowDirections = .any
        popPresentationController?.delegate = self

        present(newViewController, animated: true, completion: nil)
    }

    @objc func presentPopController5(_ sender: UIButton) {
        let newViewController = ModalViewController5(rootView: CustomView())
        newViewController.modalPresentationStyle = .popover

        let popPresentationController = newViewController.popoverPresentationController
        popPresentationController?.sourceView = sender
        popPresentationController?.sourceRect = sender.bounds
        popPresentationController?.permittedArrowDirections = .any
        popPresentationController?.delegate = self

        present(newViewController, animated: true, completion: nil)
    }

}

extension ViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // Prevent popover view controller to present in fullscreen mode for compact width / regular height
        // Prevent popover view controller to present centered for regular width / compact height
        return .none
    }

}
