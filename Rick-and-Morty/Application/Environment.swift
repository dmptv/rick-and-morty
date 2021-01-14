//
//  Environment.swift
//  Rick-and-Morty
//
//  Created by Kanat on 14.01.2021.
//

import Foundation

enum Environment {
    static let isDebug: Bool = {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }()
    
    static let baseUrl: String = {
        guard let baseUrl = Environment.infoDictionary["BASE_URL"] as? String else {
            fatalError("baseURL not found")
        }
        return baseUrl
    }()
    
    fileprivate static let infoDictionary: [String: Any] = {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            fatalError("Info.plist file not found")
        }
        return infoDictionary
    }()
}

enum App: String {
    case rickMorty = "Rick-and-Morty"
}

extension App {
    static let current: App = {
        guard let rawValue = Environment.infoDictionary["APP"] as? String,
            let app = App(rawValue: rawValue) else {
            fatalError("current app type not found")
        }
        return app
    }()
}
