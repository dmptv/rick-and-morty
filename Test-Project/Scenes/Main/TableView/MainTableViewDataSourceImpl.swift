//
//  MainTableViewDataSourceImpl.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

final class MainTableViewDataSourceImpl: NSObject {
    var sections: [CharactersSection] = []
    private let store: MainStore

    init(store: MainStore) {
        self.store = store
    }
    
}

extension MainTableViewDataSourceImpl: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
