//
//  CoordinatorFactory.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//


import Swinject
import UIKit

final class CoordinatorFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func makeMain(delegate: MainCoordinatorDelegate) -> (coordinator: Coordinator, module: BaseNavigationController) {
        let navigationController = BaseNavigationController()
        let coordinator = CharactersCoordinator(router: Router(navigationController: navigationController), assembler: assembler, delegate: delegate)
        return (coordinator, navigationController)
    }
}
