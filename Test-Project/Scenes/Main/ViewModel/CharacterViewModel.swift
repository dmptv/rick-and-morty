//
//  CharacterViewModel.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

protocol CharacterViewModelProtocol {
    var id: String? { get }
    var name: String? { get }
    var image: UIImage? { get }
    
}


struct CharacterViewModel: CharacterViewModelProtocol {
    var id: String? {
        character.id
    }
    
    var name: String? {
        character.name
    }
    
    var image: UIImage? {
        UIImage(named: "test")
    }
    
    private let character: CharacterDataModel

    init(character: CharacterDataModel) {
        self.character = character
    }
}
