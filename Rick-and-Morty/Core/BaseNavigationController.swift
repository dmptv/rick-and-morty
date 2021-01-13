//
//  BaseNavigationController.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColors()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    private func updateColors() {
        view.backgroundColor = UIColor.white
    }
}
