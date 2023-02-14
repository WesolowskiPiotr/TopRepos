//
//  RepositoriesStore.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Combine

@MainActor
final class RepositoriesStore: ObservableObject {
  enum State {
    case loading
    case error(message: String)
    case loaded(repositories: [IdentifiableRepository])
  }
  
  @Published var state: State = .loading
}

extension RepositoriesStore: RepositoriesPresenterDelegate {
  func render(errorMessage: String) {
    state = .error(message: errorMessage)
  }
  func renderLoading() {
    state = .loading
  }
    
  func render(repositories: [IdentifiableRepository]) {
      state = .loaded(repositories: repositories)
  }
}
