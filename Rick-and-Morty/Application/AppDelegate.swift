//
//  AppDelegate.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import Swinject
import UIKit

/// test branch rules

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let assembler = Assembler([BaseAssembly()])
  
    private lazy var configurator: AppDelegateConfigurator = {
        CompositeAppDelegateConfigurator(configurators: [
            StartupAppDelegateConfigurator(applicationCoordinator: applicationCoordinator, assembler: assembler)
        ])
    }()
    
    private lazy var applicationCoordinator: ApplicationCoordinator = {
        guard let navigationController = window?.rootViewController as? BaseNavigationController else {
            fatalError("rootViewController must be NavigationController")
        }
        return ApplicationCoordinator(router: Router(navigationController: navigationController), assembler: assembler)
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        _ = configurator.application?(application, didFinishLaunchingWithOptions: launchOptions)
        applicationCoordinator.start()
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = BaseNavigationController()
    }
    
}
