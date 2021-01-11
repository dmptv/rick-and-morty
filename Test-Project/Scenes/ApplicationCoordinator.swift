//
//  ApplicationCoordinator.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import Swinject
import UIKit

// swiftlint:disable file_length
final class ApplicationCoordinator: Coordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let moduleFactory: ModuleFactory

    required init(router: Router, assembler: Assembler) {
        coordinatorFactory = .init(assembler: assembler)
        moduleFactory = .init(assembler: assembler)
        super.init(router: router)
    }

    override func start() {
        showMain()
    }

    private func showMain() {
        let main = moduleFactory.makeMain(navigationDelegate: self)
        router.setRootModule(main, isNavigationBarHidden: false)
    }

}

// MARK: - MainNavigationDelegate

extension ApplicationCoordinator: MainNavigationDelegate {
    
}
