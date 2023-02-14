//
//  ApplicationCoordinator.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import SwiftUI

protocol Coordinator {
    func start()
}

class ApplicationCoordinator: Coordinator {
    let window: UIWindow

    var childCoordinators = [Coordinator]()
    init(window: UIWindow) {
        self.window = window
    }
    
    @MainActor
    func start() {
        let repositoriesCoordinator = RepositoriesListViewCoordinator()
        repositoriesCoordinator.start()
        self.childCoordinators.append(repositoriesCoordinator)
        window.rootViewController = repositoriesCoordinator.rootViewController
    }
}
