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
        assembleProviders(container)
        assembleNetwork(container)
    }
    
    private func assembleNetwork(_ container: Container) {
        container.register(Network.self) { _ in
            Network()
        }.inObjectScope(.container)
    }

    private func assembleProviders(_ container: Container) {
        container.register(Provider.self) { r in
            Provider(network: r.resolve(Network.self)!)
        }.inObjectScope(.container)
    }
}
