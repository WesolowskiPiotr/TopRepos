//
//  APIManagerMock.swift
//  TrendingRepositoriesTests
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import XCTest
@testable import TrendingRepositories

struct APIManagerMock: APIManagerProtocol {
  func perform(_ request: RequestProtocol, authToken: String) async throws -> Data {
      return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
  }

  func requestToken() async throws -> Data {
    Data(AccessTokenTestHelper.generateValidToken().utf8)
  }
}
