//
//  MainCoordinator.swift
//  Test-Project
//
//  Created by Kanat on 12.01.2021.
//

import Swinject
import UIKit

protocol MainCoordinatorDelegate: class {
    func didTapCharacter(_ coordinator: MainCoordinator)
}

// swiftlint:disable file_length
final class MainCoordinator: Coordinator {
    private let coordinatorFactory: MainCoordinatorFactory
    private let moduleFactory: MainModuleFactory
    private weak var delegate: MainCoordinatorDelegate?
    
    init(router: Router, assembler: Assembler, delegate: MainCoordinatorDelegate) {
        coordinatorFactory = .init(assembler: assembler)
        moduleFactory = .init(assembler: assembler)
        self.delegate = delegate
        super.init(router: router)
    }

    override func start() {
        showMain()
    }
    
    private func showMain() {
        let home = moduleFactory.makeMain(navigationDelegate: self)
        router.setRootModule(home)
    }
    
}

extension MainCoordinator: MainNavigationDelegate {
    
}
