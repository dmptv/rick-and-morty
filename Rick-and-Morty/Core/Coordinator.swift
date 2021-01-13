//
//  Coordinator.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

class Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    let router: Router

    init(router: Router) {
        self.router = router
    }

    func start() {}

    func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.isEmpty else { return }
        coordinator.childCoordinators.filter { $0 !== coordinator }.forEach { coordinator.removeDependency($0) }
        childCoordinators.removeAll { $0 === coordinator }
    }

    func clearChildCoordinators() {
        childCoordinators.forEach { removeDependency($0) }
    }
}
