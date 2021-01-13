//
//  Storage.swift
//  Test-Project
//
//  Created by Kanat on 09.01.2021.
//

import Foundation

final class Storage {
    let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func clearAllStorages() {
        clearServicesStorage()
    }
}
