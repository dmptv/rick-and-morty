//
//  StartupAppDelegateConfigurator.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import Swinject

final class StartupAppDelegateConfigurator: AppDelegateConfigurator {
    private let applicationCoordinator: Coordinator
    private let assembler: Assembler

    init(applicationCoordinator: Coordinator, assembler: Assembler) {
        self.applicationCoordinator = applicationCoordinator
        self.assembler = assembler
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupServices()
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    private func setupServices() {

    }
}
