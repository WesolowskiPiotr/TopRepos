//
//  RepositoriesRequest.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

enum RepositoriesRequest: RequestProtocol {
    case getRepositories
    
    var path: String {
        "/search/repositories"
    }
    
    var urlParams: [String: String?] {
        switch self {
        case .getRepositories:
            let params = ["q": "language=+sort:star"]
            return params
        }
    }
    
    var requestType: RequestType {
        .GET
    }
    
    var addAuthorizationToken: Bool {
        return false
    }
}
