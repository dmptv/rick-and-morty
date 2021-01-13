//
//  CharactersStore.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import Foundation

struct CharactersSection {
    let rows: [CharacterViewModelProtocol]
}

final class CharactersStore {
    
    enum Action {
        case didLoadView
        case didSelectRow(indexPath: IndexPath)
    }

    enum State {
        case loading
        case loadingFinished
        case error(message: String?)
        case sections(sections: [CharactersSection])
        case selectedCharacter(_ character: CharacterDataModel)
    }
    
    private let provider: MainProvider
    private var allCharacters: [CharacterDataModel] = []
    
    @Observable private(set) var state: State?
    
    init(provider: MainProvider) {
        self.provider = provider
    }
    
    func dispatch(action: Action) {
        switch action {
        case .didLoadView:
            state = .loading
            getCharacters()
        case .didSelectRow(indexPath: let indexPath):
            let character = allCharacters[indexPath.row]
            state = .selectedCharacter(character)
        }
    }
    
    private func getCharacters() {
        provider.getCharacters { [self] characters, errorMessage  in
            if let characters = characters {
                self.allCharacters.append(contentsOf: characters)
                self.setupSections()
            } else {
                state = .error(message: errorMessage)
            }
        }
        
    }
    
    private func setupSections() {
        let viewModels: [CharacterViewModelProtocol] = self.allCharacters.map { char in
            CharacterViewModel(character: char)
        }
        
        let rows: [CharacterViewModelProtocol] = viewModels
        let charSection = CharactersSection(rows: rows)
        state = .loadingFinished
        state = .sections(sections: [charSection])
    }
        
}
