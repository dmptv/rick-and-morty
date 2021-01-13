//
//  CharactersTableViewDelegateImpl.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

final class CharactersTableViewDelegateImpl: NSObject {
    var sections: [CharactersSection] = []
    private let store: CharactersStore

    init(store: CharactersStore) {
        self.store = store
    }
}

extension CharactersTableViewDelegateImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        store.dispatch(action: .didSelectRow(indexPath: indexPath))
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
