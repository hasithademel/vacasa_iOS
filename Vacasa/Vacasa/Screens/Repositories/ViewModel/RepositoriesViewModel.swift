//
//  RepositoriesViewModel.swift
//  Vacasa
//
//  Created by Hasitha De Mel on 10/05/22.
//

import Foundation

class RepositoriesViewModel: ObservableObject {
    
    @Published private(set) var repos: [Repository] = []
    
    func loadRepositories() {
        Task {
            do {
                let repos = try await APIManager.loadRepos()
                self.repos = repos
            } catch {
                print("\(error)")
            }
        }
    }
    
    func numberOfRepos() -> Int {
        return repos.count
    }
    
    func repoAt(row: Int) -> Repository {
        return repos[row]
    }
}
