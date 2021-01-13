//
//  CharactersTableViewDataSourceImpl.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

final class CharactersTableViewDataSourceImpl: NSObject {
    var sections: [CharactersSection] = []
    private let store: CharactersStore

    init(store: CharactersStore) {
        self.store = store
    }
    
}

extension CharactersTableViewDataSourceImpl: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sections[indexPath.section].rows[indexPath.row]
        let cell: CharacterTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel)
        return cell
    }
}
