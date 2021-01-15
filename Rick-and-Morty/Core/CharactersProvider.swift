//
//  CharactersProvider.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import Foundation
import Promises

protocol CharactersProvider {
    func getCharacters(_ page: Int) -> Promise<CharacterCharactersResponse>
}

extension Provider: CharactersProvider {
    func getCharacters(_ page: Int) -> Promise<CharacterCharactersResponse> {
        return Promise { [weak self] fulfill, reject in
            guard let self = self else { return }
            let url = "/character/?page=\(page)"
            self.network.request(url) { result in
                switch result {
                case .success(let data):
                    do {
                        let parsedResult: CharacterCharactersResponse = try JSONDecoder().decode(CharacterCharactersResponse.self, from: data)
                        fulfill(parsedResult)
                    } catch let error {
                        reject(error)
                        return
                    }
                case .failure(let error):
                    reject(error)
                    return
                }
            }
            
        }
    }
    
}
