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
        let home = runMainFlow()
        makeTabbar([home])
    }

    private func makeTabbar(_ viewControllers: [UIViewController]) {
        let tabbar = moduleFactory.makeTabbar(viewControllers: viewControllers, navigationDelegate: self)
        router.setRootModule(tabbar, isNavigationBarHidden: true)
    }
    
    private func runMainFlow() -> UIViewController {
        let (coordinator, module) = coordinatorFactory.makeMain(delegate: self)
        coordinator.start()
        addDependency(coordinator)
        return module
    }

}

extension ApplicationCoordinator: MainCoordinatorDelegate {
    func didTapCharacter(_ coordinator: CharactersCoordinator) {
        
    }
    
    
}

// MARK: - MainNavigationDelegate

extension ApplicationCoordinator: TabbarControllerDelegate {
    func onHomeFlowSelect(_ viewController: TabbarController) {
        
    }
    
    func onSecondFlowSelect(_ viewController: TabbarController) {
        
    }
    
    
}
