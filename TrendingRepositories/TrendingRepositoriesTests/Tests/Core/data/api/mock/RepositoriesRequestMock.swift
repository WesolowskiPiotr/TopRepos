//
//  RepositoriesRequestMock.swift
//  TrendingRepositoriesTests
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation
@testable import TrendingRepositories

enum RepositoriesRequestMock: RequestProtocol {
    case getRepositories
    
    var requestType: RequestType {
        return .GET
    }
    
    var path: String {
        guard let path = Bundle.main.path(forResource: "TrendingRepositories", ofType: "json") else { return "" }
        return path
    }
    
    var addAuthorizationToken: Bool {
        return false
    }
}
