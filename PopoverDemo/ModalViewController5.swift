//
//  ModalViewController5.swift
//  PopoverDemo
//
//  Created by Imanou Petit on 18/09/2020.
//  Copyright © 2020 Imanou Petit. All rights reserved.
//

import SwiftUI
import UIKit

struct CustomView: View {

    var body: some View {
        Color.yellow
    }
}

/*
 A hosting controller subclass that sets is preferredContentSize.
 */
class ModalViewController5: UIHostingController<CustomView> {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // ⚠️ Note that we have to set preferredContentSize in viewWillAppear
        // (not viewDidLoad) for it to be taken into account.
        preferredContentSize = CGSize(width: 200, height: 200)
    }

}
