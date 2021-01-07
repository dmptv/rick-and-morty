//
//  MainTableViewDelegateImpl.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

final class MainTableViewDelegateImpl: NSObject {
    var sections: [CharactersSection] = []
    private let store: MainStore

    init(store: MainStore) {
        self.store = store
    }
}

extension MainTableViewDelegateImpl: UITableViewDelegate {

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        56
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        56
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch sections[indexPath.section].rows[indexPath.row] {
        case let .character(viewModel):
            guard let cell = cell as? CharacterTableViewCell else { return }
            cell.configure(with: viewModel)
        }
    }

}
