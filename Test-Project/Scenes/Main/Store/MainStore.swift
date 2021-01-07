//
//  MainStore.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import Foundation

struct CharactersSection {
    let rows: [CharacterViewModelProtocol]
}

final class MainStore {
    
    enum Action {
        case didLoadView
    }

    enum State {
        case loading
        case loadingFinished
        case error(message: String?)
        case sections(sections: [CharactersSection])
    }
    
    private let provider: MainProvider
    
    @Observable private(set) var state: State?
    
    init(provider: MainProvider) {
        self.provider = provider
    }
    
    func dispatch(action: Action) {
        switch action {
        case .didLoadView:
            state = .loading
            getCharacters()
        }
    }
    
    private func getCharacters() {
        setupSections()
    }
    
    private func setupSections() {
        let characters: [CharacterDataModel] = [
            CharacterDataModel(id: "12", name: "12", image: "12"),
            CharacterDataModel(id: "12", name: "12", image: "12"),
            CharacterDataModel(id: "12", name: "12", image: "12")
        ]
        
        let viewModels: [CharacterViewModelProtocol] = characters.map { char in
            CharacterViewModel(character: char)
        }
        
        let rows: [CharacterViewModelProtocol] = viewModels
        let charSection = CharactersSection(rows: rows)
        state = .sections(sections: [charSection])
    }
        
}
