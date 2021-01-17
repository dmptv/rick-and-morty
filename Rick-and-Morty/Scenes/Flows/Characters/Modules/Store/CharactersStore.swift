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
        case infiniteScrollDidStart
    }

    enum State {
        case loading
        case loadingFinished
        case error(message: String?)
        case sections(sections: [CharactersSection])
        case selectedCharacter(_ character: CharacterDataModel)
        case infiniteScrollingDisabled
    }
    
    private let provider: CharactersProvider
    private var allCharacters: [CharacterDataModel] = []
    private var allPages: Int = 0
    private var fetchedPages: Int = 0
    
    @Observable private(set) var state: State?
    
    init(provider: CharactersProvider) {
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
        case .infiniteScrollDidStart:
            getCharacters()
        }
    }
    
    private func getCharacters() {
        if (fetchedPages == 0) || (allPages / fetchedPages) > 1 {
            provider.getCharacters(fetchedPages + 1).then { [weak self] response in
                guard let self = self else { return }
                self.allPages = response.info.pages
                self.allCharacters.append(contentsOf: response.results)
                self.fetchedPages += 1
                self.setupSections()
                
            }.catch { error in
                self.state = .error(message: error.localizedDescription)
            }
        } else {
            state = .infiniteScrollingDisabled
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
