//
//  ModuleFactory.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import Swinject
import UIKit

final class ModuleFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func makeMain(navigationDelegate: MainNavigationDelegate) -> UIViewController {
        let mainViewController = MainViewController(navigationDelegate: navigationDelegate)
        return mainViewController
    }
}
