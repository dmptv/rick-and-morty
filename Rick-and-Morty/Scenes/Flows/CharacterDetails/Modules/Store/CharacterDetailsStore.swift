//
//  CharacterDetailsStore.swift
//  Rick-and-Morty
//
//  Created by Kanat on 13.01.2021.
//

import Foundation

final class CharacterDetailsStore {
    
    enum Action {
        case didLoadView
    }
    
    // swiftlint:disable enum_case_associated_values_count function_body_length
    enum State {
        case loading
        case loadingFinished
        case error(message: String?)
    }
    
    private var character: CharacterDataModel
    
    @Observable private(set) var state: State?
    
    init(character: CharacterDataModel) {
        self.character = character
    }
    
    func dispatch(action: Action) {
        switch action {
        case .didLoadView:
            state = .loading
            configureView()
        }
    }
    
    private func configureView() {
        state = .loadingFinished
    }
}
