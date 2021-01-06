//
//  MainTableViewDelegateImpl.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

final class MainTableViewDelegateImpl: NSObject {
    
    private let store: MainStore

    init(store: MainStore) {
        self.store = store
    }
}
