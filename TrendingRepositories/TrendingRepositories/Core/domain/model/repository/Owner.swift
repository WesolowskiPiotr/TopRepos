//
//  Owner.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation

struct Owner: Codable, Hashable {
    let login: String
    let avatar: String
}

extension Owner {
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatar = "avatarUrl"
    }
}
