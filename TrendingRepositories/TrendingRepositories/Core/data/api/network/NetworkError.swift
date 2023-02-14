//
//  NetworkError.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation

public enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "Incorrect URL string."
    }
  }
}
