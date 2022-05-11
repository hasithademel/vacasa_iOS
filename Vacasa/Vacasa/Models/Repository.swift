//
//  Repository.swift
//  Vacasa
//
//  Created by Hasitha De Mel on 10/05/22.
//

import Foundation

struct RepositoryResponse: Codable {
    var items: [Repository]?
}

struct Repository: Codable {
    var name: String?
    var description: String?
}
