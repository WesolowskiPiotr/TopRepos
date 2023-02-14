//
//  RepositoryMock.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation

// MARK: - Mock data
extension Repository {
  static let mock = loadRepositories()
}

private struct RepositoryMock: Codable {
  let items: [Repository]
}

private func loadRepositories() -> [Repository] {
  guard let url = Bundle.main.url(forResource: "TrendingRepositories", withExtension: "json"),
    let data = try? Data(contentsOf: url) else { return [] }
  let decoder = JSONDecoder()
  decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
        let jsonMock = try decoder.decode(RepositoryMock.self, from: data)
        return jsonMock.items
    } catch DecodingError.keyNotFound(let key, let context) {
        print("Key '\(key)' not found:", context.debugDescription)
        print("codingPath:", context.codingPath)
    } catch {
        print(error.localizedDescription)
    }
    return []
}
