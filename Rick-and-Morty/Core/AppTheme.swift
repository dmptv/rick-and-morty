//
//  AppTheme.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import UIKit

enum AppTheme: String, CaseIterable {
    case dark
    case light
    case system

    @available(iOS 12.0, *)
    init(userInterfaceStyle: UIUserInterfaceStyle) {
        switch userInterfaceStyle {
        case .dark:
            self = .dark
        case .light:
            self = .light
        case .unspecified:
            self = .dark
        @unknown default:
            self = .dark
        }
    }
}

extension AppTheme {
    static let `default` = AppTheme.system

    @available(iOS 12.0, *)
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .dark:
            return .dark
        case .light:
            return .light
        case .system:
            return UIScreen.main.traitCollection.userInterfaceStyle
        }
    }

    var title: String {
        switch self {
        case .dark:
            return "AppTheme.dark"
        case .light:
            return "AppTheme.light"
        case .system:
            return "AppTheme.system"
        }
    }
}

private enum Constants {
    static let appTheme = "appTheme"
}

extension AppTheme {
    static var current: AppTheme {
        get { getCurrentAppTheme() }
        set { UserDefaults.standard.set(newValue.rawValue, forKey: Constants.appTheme) }
    }

    private static func getCurrentAppTheme() -> AppTheme {
        guard let rawValue = UserDefaults.standard.string(forKey: Constants.appTheme),
            let appTheme = AppTheme(rawValue: rawValue) else { return .system }
        return appTheme
    }
}

extension UIUserInterfaceStyle {
    var title: String {
        switch self {
        case .light:
            return "light"
        default:
            return "dark"
        }
    }
}
