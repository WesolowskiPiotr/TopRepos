//
//  FetchRepositoryService.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation

@MainActor
class FetchRepositoryService {
    let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

// MARK: - TransactionlFetcher
extension FetchRepositoryService: RepositoriesServicesProtocol {
    func fetchRepositories(request: RequestProtocol,
                           completion: @escaping (Result<[Repository], NetworkError>) -> Void) async {
        let requestData = request
        do {
            let repositoriesContainer: RepositoriesContainer = try await
            requestManager.perform(requestData)
            completion(.success(repositoriesContainer.items))
        } catch {
            completion(.failure(.invalidServerResponse))
        }
    }
}
