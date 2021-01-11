//
//  ServicesStorage.swift
//  Test-Project
//
//  Created by Kanat on 09.01.2021.
//

import Disk

private enum Constant {
    static let characters = "ServicesStorage/characters.json"
}

protocol ServicesStorage: class {
    var characters: [CharacterDataModel] { get set }
}

extension Storage: ServicesStorage {
    var characters: [CharacterDataModel] {
        get { (try? Disk.retrieve(Constant.characters, from: .caches, as: [CharacterDataModel].self)) ?? [] }
        set { try? Disk.save(newValue, to: .caches, as: Constant.characters) }
    }
    
    func clearServicesStorage() {
        characters = []
    }
}
