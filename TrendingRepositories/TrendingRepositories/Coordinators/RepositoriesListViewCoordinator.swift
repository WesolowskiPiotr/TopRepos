//
//  RepositoriesListViewCoordinator.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation
import SwiftUI

class RepositoriesListViewCoordinator: Coordinator {
    var rootViewController = UIViewController()
    
    @MainActor
    func start() {
        let view = RepositoriesListView(
            store: RepositoriesStore(),
            presenter: RepositoriesListPresenter(service: FetchRepositoryService(requestManager: RequestManager()))
        )
        rootViewController = UIHostingController(rootView: view)
    }
}
