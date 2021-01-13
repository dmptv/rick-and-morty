//
//  MainModuleFactory.swift
//  Test-Project
//
//  Created by Kanat on 12.01.2021.
//

import Swinject
import UIKit

final class CharactersModuleFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func makeMain(navigationDelegate: CharactersNavigationDelegate) -> UIViewController {
        let store = CharactersStore(provider: assembler.resolver.resolve(Provider.self)!)
        let mainViewController = CharactersViewController(store: store, navigationDelegate: navigationDelegate)
        return mainViewController
    }
}
