//
//  CompositeAppDelegateConfigurator.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import UIKit

typealias AppDelegateConfigurator = UIResponder & UIApplicationDelegate

final class CompositeAppDelegateConfigurator: AppDelegateConfigurator {
    private let configurators: [AppDelegateConfigurator]

    init(configurators: [AppDelegateConfigurator]) {
        self.configurators = configurators
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configurators.forEach { _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) }
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        configurators.forEach { $0.applicationDidBecomeActive?(application) }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        configurators.forEach { $0.applicationWillResignActive?(application) }
    }
}
