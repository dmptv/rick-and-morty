//
//  CharactersCoordinator.swift
//  Test-Project
//
//  Created by Kanat on 12.01.2021.
//

import Swinject
import UIKit

protocol MainCoordinatorDelegate: class {
    func didTapCharacter(_ coordinator: CharactersCoordinator)
}

// swiftlint:disable file_length
final class CharactersCoordinator: Coordinator {
    private let coordinatorFactory: CharactersCoordinatorFactory
    private let moduleFactory: CharactersModuleFactory
    private weak var delegate: MainCoordinatorDelegate?
    
    init(router: Router, assembler: Assembler, delegate: MainCoordinatorDelegate) {
        coordinatorFactory = .init(assembler: assembler)
        moduleFactory = .init(assembler: assembler)
        self.delegate = delegate
        super.init(router: router)
    }

    override func start() {
        showCharacters()
    }
    
    private func showCharacters() {
        let home = moduleFactory.makeMain(navigationDelegate: self)
        router.setRootModule(home)
    }
    
    private func runCharacterDetailsFlow(_ selectedCharacter: CharacterDataModel) {
        let coordinator = coordinatorFactory.makeCharacterDetails(character: selectedCharacter, delegate: self, router: router)
        addDependency(coordinator)
        coordinator.start()
    }
    
}

extension CharactersCoordinator: CharactersNavigationDelegate {
    func characterDidSelect(_ viewController: CharactersViewController, selectedCharacter: CharacterDataModel) {
        runCharacterDetailsFlow(selectedCharacter)
    }
}

extension CharactersCoordinator: CharacterDetailsCoordinatorDelegate {
    func didClose(_ coordinator: CharacterDetailsCoordinator) {
        
    }
    
    func didFinish(_ coordinator: CharacterDetailsCoordinator) {
        
    }
}
