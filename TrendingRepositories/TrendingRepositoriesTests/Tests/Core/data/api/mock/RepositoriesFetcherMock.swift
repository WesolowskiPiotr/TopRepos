//
//  RepositoriesFetcherMock.swift
//  TrendingRepositoriesTests
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation
@testable import TrendingRepositories

class RepositoriesFetcherMock {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension RepositoriesFetcherMock: RepositoriesServicesProtocol {
    func fetchRepositories(request: RequestProtocol,
                           completion: @escaping (Result<[Repository], NetworkError>) -> Void) async {
        let requestData = RepositoriesRequestMock.getRepositories
        do {
        let repositoriesContainer: RepositoriesContainer = try await
            requestManager.perform(requestData)
            completion(.success(repositoriesContainer.items))
        } catch {
            completion(.failure(.invalidServerResponse))
        }
    }
}
