//
//  CharacterDetailsCoordinator.swift
//  Rick-and-Morty
//
//  Created by Kanat on 13.01.2021.
//

import Swinject
import UIKit

protocol CharacterDetailsCoordinatorDelegate: class {
    func didClose(_ coordinator: CharacterDetailsCoordinator)
    func didFinish(_ coordinator: CharacterDetailsCoordinator)
}

final class CharacterDetailsCoordinator: Coordinator {
    private let character: CharacterDataModel
    private let moduleFactory: CharacterDetailsModuleFactory
    private weak var delegate: CharacterDetailsCoordinatorDelegate?
    
    init(character: CharacterDataModel,
         router: Router,
         assembler: Assembler,
         delegate: CharacterDetailsCoordinatorDelegate) {
        self.character = character
        moduleFactory = .init(assembler: assembler)
        self.delegate = delegate
        super.init(router: router)
    }

    override func start() {
        showCharacterDetails()
    }
    
    private func showCharacterDetails() {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        router.push(vc)
    }
    
}
