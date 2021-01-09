//
//  CharacterViewModel.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

protocol CharacterViewModelProtocol {
    var id: Int? { get }
    var name: String? { get }
    var image: URL? { get }
}

struct CharacterViewModel: CharacterViewModelProtocol {
    var id: Int? {
        character.id
    }
    
    var name: String? {
        character.name
    }
    
    var image: URL? {
        URL(string: character.image)
    }
    
    private let character: CharacterDataModel

    init(character: CharacterDataModel) {
        self.character = character
    }
}
