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
        let home = runCharactersFlow()
        let vc = UIViewController()
        let nav = BaseNavigationController(rootViewController: vc)
        makeTabbar([home, nav])
    }

    private func makeTabbar(_ viewControllers: [UIViewController]) {
        let tabbar = moduleFactory.makeTabbar(viewControllers: viewControllers, navigationDelegate: self)
        router.setRootModule(tabbar, isNavigationBarHidden: true)
    }
    
    private func runCharactersFlow() -> BaseNavigationController {
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
    func onCharactersFlowSelect(_ viewController: BaseNavigationController) {
        
    }
    
    func onEpisodesFlowSelect(_ viewController: BaseNavigationController) {
        
    }
    
    
}
