//
//  RequestManagerTests.swift
//  TrendingRepositoriesTests
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import XCTest
@testable import TrendingRepositories

class RequestManagerTests: XCTestCase {
  private var requestManager: RequestManagerProtocol?

  override func setUp() {
    super.setUp()
    guard let userDefaults = UserDefaults(suiteName: #file) else { return }
    userDefaults.removePersistentDomain(forName: #file)
    requestManager = RequestManagerMock(
      apiManager: APIManagerMock(),
      accessTokenManager: AccessTokenManager(userDefaults: userDefaults)
    )
  }
    
    func testRequestRepositories() async throws {
        guard let container: RepositoriesContainer =
                   try await requestManager?.perform(RepositoriesRequestMock.getRepositories) else { return }
        let first = container.items.first
        let last = container.items.last
        XCTAssertEqual(first?.name, "go")
        XCTAssertEqual(first?.description, "The Go programming language")
        XCTAssertEqual(first?.language, "Go")
        XCTAssertEqual(first?.stars, 108415)
        XCTAssertEqual(first?.owner.login, "golang")
        XCTAssertEqual(first?.owner.avatar, "https://avatars.githubusercontent.com/u/4314092?v=4")
        
        XCTAssertEqual(last?.name, "ruby")
        XCTAssertEqual(last?.description, "The Ruby Programming Language [mirror]")
        XCTAssertEqual(last?.language, "Ruby")
        XCTAssertEqual(last?.stars, 19934)
        XCTAssertEqual(last?.owner.login, "ruby")
        XCTAssertEqual(last?.owner.avatar, "https://avatars.githubusercontent.com/u/210414?v=4")
    }
}
