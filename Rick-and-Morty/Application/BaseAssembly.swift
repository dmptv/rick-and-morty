//
//  BaseAssembly.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import Swinject

final class BaseAssembly: Assembly {
    init() {}

    func assemble(container: Container) {
        assembleEnvironment(container)
        assembleNetwork(container)
        assembleProviders(container)
    }
    
    private func assembleEnvironment(_ container: Container) {
        container.register(String.self, name: "baseUrl") { _ in
            Environment.baseUrl
        }
    }
    
    private func assembleNetwork(_ container: Container) {
        container.register(Network.self) { r in
            Network(baseUrl: r.resolve(String.self, name: "baseUrl")!)
        }.inObjectScope(.container)
    }

    private func assembleProviders(_ container: Container) {
        container.register(Provider.self) { r in
            Provider(network: r.resolve(Network.self)!)
        }.inObjectScope(.container)
    }
}
