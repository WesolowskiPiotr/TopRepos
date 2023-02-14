//
//  RepositoriesListPresenterTestCase.swift
//  TrendingRepositoriesTests
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation
import XCTest
@testable import TrendingRepositories

@MainActor
final class RepositoriesListPresenterTestCase: XCTestCase {
    var presenter: RepositoriesListPresenter!
    var accessTokenManager: AccessTokenManagerProtocol?
    var requestManager: RequestManagerMock?

    @MainActor
    override func setUp() {
        super.setUp()
        guard let userDefaults = UserDefaults(suiteName: #file) else { return }
        userDefaults.removePersistentDomain(forName: #file)
        accessTokenManager = AccessTokenManager(userDefaults: userDefaults)
        guard let accessTokenManager = accessTokenManager else { return }
        presenter = RepositoriesListPresenter(
            service: RepositoriesFetcherMock(
                requestManager: RequestManagerMock(
                    apiManager: APIManagerMock(),
                    accessTokenManager: accessTokenManager)))
    }

    override func tearDown() {
        presenter = nil
        accessTokenManager = nil
        requestManager = nil
        super.tearDown()
    }

    func testInitializedPresenter() {
        XCTAssertNotNil(presenter.service)
        XCTAssertNil(presenter.delegate)
        XCTAssertEqual(presenter.repositories, [])
        XCTAssertEqual(presenter.viewRepositories, [])
    }
    
    func testSetViewDelegateNotNil() {
        // Given
        let store = RepositoriesStore()
        
        // When
        presenter.setViewDelegate(delegate: store)
        
        // Then
        XCTAssertNotNil(presenter.delegate, "Delegate not set")
    }
    
    func testFetchTransactionsProvideRepositoriesList() async {
        // When
        await presenter.fetchRepositories()

        // Then
        XCTAssertTrue(!presenter.repositories.isEmpty, "Empty repositories has been fetched, but it shoudn't.")
    }
    
    func testMapRepositoriesToIdentifiableRepositories() {
        // Given
        let repositories = [Repository.example]
        var mappedRepositories = [IdentifiableRepository]()
        
        // When
        mappedRepositories = presenter.mapToViewRepositories(repositories)
        
        // Then
        XCTAssertEqual(mappedRepositories.first?.repository.name, "Name")
        XCTAssertEqual(mappedRepositories.first?.repository.description, "Description")
        XCTAssertEqual(mappedRepositories.first?.repository.language, "Language")
        XCTAssertEqual(mappedRepositories.first?.repository.stars, 123)
    }
}
