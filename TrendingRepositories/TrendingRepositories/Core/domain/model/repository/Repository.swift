//
//  Repository.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation

struct Repository: Codable, Hashable {
    let name: String
    let description: String
    let language: String?
    let stars: Int
    let owner: Owner
}

extension Repository {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case language = "language"
        case stars = "stargazersCount"
        case owner = "owner"
    }
    
    static let example = Repository(
        name: "Name",
        description: "Description",
        language: "Language",
        stars: 123,
        owner: Owner(
            login: "Login",
            avatar: "Avatar")
    )
}
