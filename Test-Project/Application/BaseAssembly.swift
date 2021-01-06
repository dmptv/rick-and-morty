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
        container.register(AlamofireNetwork.self) { _ in
            AlamofireNetwork()
        }.inObjectScope(.container)
    }

    private func assembleProviders(_ container: Container) {
        container.register(Provider.self) { r in
            Provider(alamofireNetwork: r.resolve(AlamofireNetwork.self)!)
        }.inObjectScope(.container)
    }
}
