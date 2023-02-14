//
//  RepositoriesListView.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import SwiftUI

struct RepositoriesListView: View {
    @ObservedObject var store: RepositoriesStore
    @ObservedObject var monitor = NetworkMonitor()
    var presenter: RepositoriesListPresenter
    
    init(store: RepositoriesStore, presenter: RepositoriesListPresenter) {
        self.store = store
        self.presenter = presenter
        
        presenter.setViewDelegate(delegate: store)
    }
    
    var body: some View {
        if monitor.isConnected {
            NavigationView { () -> AnyView in
                switch store.state {
                case .loading:
                    return AnyView(LoadingView())
                case .error:
                    return AnyView(ErrorView(fetchRepositories: { await presenter.fetchRepositories() }))
                case .loaded(let repositories):
                    if repositories.isEmpty {
                        return AnyView(EmptyListView())
                    } else {
                        return AnyView(RepositoriesDisplayListView(
                            store: store,
                            repositories: repositories,
                            presenter: presenter))
                    }
                }
            }
            .onAppear(perform: {
                Task {
                    await presenter.fetchRepositories()
                }
            })
        } else {
            AnyView(InternetConnectionView(fetchRepositories: { await presenter.fetchRepositories() }))
        }
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesListView(
            store: RepositoriesStore(),
            presenter: RepositoriesListPresenter(
                service: FetchRepositoryService(
                    requestManager: RequestManager(
                    )
                )
            )
        )
    }
}
