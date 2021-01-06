//
//  MainStore.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import Foundation

struct CharactersSection {
    enum SectionType {
        case characters
    }

    enum RowType {
        case character(viewModel: CharacterViewModelProtocol)
    }

    let type: SectionType
    let rows: [RowType]
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
            getData()
        }
    }
    
    private func getData() {
        
    }
        
}
