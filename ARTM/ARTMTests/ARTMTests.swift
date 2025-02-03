//
//  ARTMTests.swift
//  ARTMTests
//
//  Created by Chris Comeau on 2025-02-03.
//

import XCTest
@testable import ARTM

class CountryServiceTests: XCTestCase {

    func testFetchCountriesSuccess() {
        let service = CountryService()
        let expectation = self.expectation(description: "Fetching countries")

        service.fetchCountries { result in
            switch result {
            case .success(let countries):
                XCTAssertFalse(countries.isEmpty, "Countries should not be empty")
            case .failure(let error):
                XCTFail("Failed with error: \(error)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5)
    }
}
