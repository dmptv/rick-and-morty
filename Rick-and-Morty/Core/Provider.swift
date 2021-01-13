//
//  Provider.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import Foundation

protocol MainProvider {
    func getCharacters(_ completion: @escaping ([CharacterDataModel]?, String?) -> Void)
}

final class Provider {
    let network: Network

    init(network: Network) {
        self.network = network
    }
}

extension Provider: MainProvider {
    func getCharacters(_ completion: @escaping ([CharacterDataModel]?, String?) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        
        network.request(url) { result in
            switch result {
            case .success(let data):
                do {
                    let parsedResult: CharacterCharactersResponse = try JSONDecoder().decode(CharacterCharactersResponse.self, from: data)
                    completion(parsedResult.results, nil)
                    
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
            
        }
    }
}
