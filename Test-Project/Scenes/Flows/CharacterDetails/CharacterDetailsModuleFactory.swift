//
//  CharacterDetailsModuleFactory.swift
//  Rick-and-Morty
//
//  Created by Kanat on 13.01.2021.
//

import Foundation
import Swinject

final class CharacterDetailsModuleFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

}
