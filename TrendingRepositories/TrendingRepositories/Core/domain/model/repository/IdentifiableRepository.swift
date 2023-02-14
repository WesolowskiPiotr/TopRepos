//
//  IdentifiableRepository.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

struct IdentifiableRepository: Codable {
    var id: Int
    let repository: Repository
    
    init(id: Int, repository: Repository) {
        self.id = id
        self.repository = Repository(
            name: repository.name,
            description: repository.description,
            language: repository.language ?? .empty,
            stars: repository.stars,
            owner: Owner(
                login: repository.owner.login,
                avatar: repository.owner.avatar))
    }
}

// MARK: - Identifiable
extension IdentifiableRepository: Identifiable, Hashable {
}
