//
//  RepositoriesListPresenter.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation

protocol RepositoriesServicesProtocol: AnyObject {
    func fetchRepositories(request: RequestProtocol, completion: @escaping (Result<[Repository], NetworkError>) -> Void) async
}

protocol RepositoriesPresenterProtocol: AnyObject {
    func fetchRepositories() async
    func setViewDelegate(delegate: RepositoriesPresenterDelegate)
}

protocol RepositoriesPresenterDelegate: AnyObject {
    func render(errorMessage: String)
    func renderLoading()
    func render(repositories: [IdentifiableRepository])
}

final class RepositoriesListPresenter: RepositoriesPresenterProtocol {
    var service: RepositoriesServicesProtocol
    weak var delegate: RepositoriesPresenterDelegate?
    var repositories: [Repository] = []
    var viewRepositories: [IdentifiableRepository] = []

    init(service: RepositoriesServicesProtocol) {
        self.service = service
    }

    func fetchRepositories() async {
        await service.fetchRepositories(request: RepositoriesRequest.getRepositories) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.render(errorMessage: error.localizedDescription)
            case .success(let repositories):
                self?.repositories = repositories
                self?.viewRepositories = self?.mapToViewRepositories(repositories) ?? []
                self?.delegate?.render(repositories: self?.viewRepositories ?? [])
            }
        }
    }
    
    @MainActor
    func setViewDelegate(delegate: RepositoriesPresenterDelegate) {
        self.delegate = delegate
    }

    func mapToViewRepositories(_ repositories: [Repository]) -> [IdentifiableRepository] {
        return repositories.enumerated().map { (index, repository) in
            IdentifiableRepository(id: index, repository: repository)
        }
    }
}
