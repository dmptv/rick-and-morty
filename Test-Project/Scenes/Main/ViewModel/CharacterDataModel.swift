//
//  CharacterDataModel.swift
//  Test-Project
//
//  Created by Kanat on 07.01.2021.
//

import Foundation

struct  CharacterCharactersResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    let results: [CharacterDataModel]
}

struct CharacterDataModel: Codable {
    var id: Int
    var name: String
    var image: String
}
