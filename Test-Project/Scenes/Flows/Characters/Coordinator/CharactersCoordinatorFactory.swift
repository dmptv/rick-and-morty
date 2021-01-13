//
//  CharactersCoordinatorFactory.swift
//  Test-Project
//
//  Created by Kanat on 12.01.2021.
//

import Swinject
import UIKit

final class CharactersCoordinatorFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func makeCharacterDetails(character: CharacterDataModel,
                              delegate: CharacterDetailsCoordinatorDelegate,
                              router: Router) -> Coordinator {
        CharacterDetailsCoordinator(
            character: character,
            router: router,
            assembler: assembler,
            delegate: delegate)
    }
}
