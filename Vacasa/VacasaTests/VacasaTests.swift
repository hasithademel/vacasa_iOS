//
//  VacasaTests.swift
//  VacasaTests
//
//  Created by Hasitha De Mel on 11/05/22.
//

import XCTest

class VacasaTests: XCTestCase {

    func testFetchRepositories() {
        Task {
            do {
                let repos = try await APIManager.loadRepos()
                await waitForExpectations(timeout: 5, handler: nil)
                XCTAssertGreaterThan(repos.count, 0)
            } catch {
                XCTFail("\(error)")
            }
        }
    }
}
