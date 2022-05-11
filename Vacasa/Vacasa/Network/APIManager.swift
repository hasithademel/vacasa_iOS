//
//  APIManager.swift
//  Vacasa
//
//  Created by Hasitha De Mel on 10/05/22.
//

import Foundation

struct APIManager {
    
    enum APIManagerError: Error {
        case invalidURL
        case missingData
    }
    
    enum Endpoint {
        case repositories
        
        var url: String {
            switch self {
            case .repositories:
                return "https://api.github.com/search/repositories?q=org:vacasaoss&sort=stars&order=desc"
            }
        }
    }
    
    // MARK: - Fetch repos
    static func loadRepos() async throws -> [Repository] {
        guard let url = URL(string: Endpoint.repositories.url) else {
            print("Invalid URL")
            throw APIManagerError.invalidURL
        }
        var request = URLRequest(url: url)
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        let session = URLSession.shared
        let (data, _) = try await session.data(for: request)
        let result = try JSONDecoder().decode(RepositoryResponse.self, from: data)
        return result.items ?? []
    }

}
