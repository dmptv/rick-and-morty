//
//  EpisodesViewController.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import UIKit

class EpisodesViewController: BaseViewController {

    var characters: [CharacterSmall]?
    
    var currentPage = 1 {
        didSet {
            fetchCharacters()
        }
    }
    
    private(set) var totalPage: Int?
    private(set) var totalCharacters: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCharacters()

    }

    private func fetchCharacters() {
        let fetchedPage = currentPage
        
        ApolloNetwork.shared.apollo.fetch(query: GetCharactersQuery(page: currentPage)) { [weak self] result in
            switch result {
            case .success(let result):
                
                if fetchedPage > 1 {
                    if let newCharacters = result.data?.characters?.results?.compactMap({ $0?.fragments.characterSmall }) {
                        self?.characters?.append(contentsOf: newCharacters)
                        print("***", self?.characters?.count as Any)
                    }
                } else {
                    self?.characters = result.data?.characters?.results?.compactMap { $0?.fragments.characterSmall }
                    print("***", self?.characters?.count as Any)
                }
                
                self?.totalPage = result.data?.characters?.info?.pages
                self?.totalCharacters = result.data?.characters?.info?.count
        
            case .failure(let error):
                print("GraphQL query error: \(error)")
            }
        }

    }
}
