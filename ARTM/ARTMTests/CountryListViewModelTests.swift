//
//  CountryListViewModelTests.swift
//  ARTM
//
//  Created by Chris Comeau on 2025-02-03.
//

import XCTest
@testable import ARTM

class CountryListViewModelTests: XCTestCase {

    var viewModel: CountryListViewModel!
    var mockService: MockCountryService!

    override func setUp() {
        super.setUp()
        mockService = MockCountryService()
        viewModel = CountryListViewModel(service: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }

    func testFetchCountriesSuccess() {
        // Create the expectation
        let expectation = self.expectation(description: "Fetch countries success")

        // Set mock service behavior
        mockService.shouldReturnError = false

        // Fetch countries
        viewModel.fetchCountries()

        // Use Combine or DispatchQueue to handle async properly
        DispatchQueue.main.async {
            XCTAssertFalse(self.viewModel.countries.isEmpty, "Countries should be loaded")
            XCTAssertNil(self.viewModel.errorMessage, "Error message should be nil on success")
            expectation.fulfill()  // Fulfill the expectation after assertions pass
        }

        // Wait for expectations (max 1 second)
        waitForExpectations(timeout: 1)
    }

    func testFetchCountriesFailure() {
        // Create the expectation
        let expectation = self.expectation(description: "Fetch countries failure")

        // Simulate failure in mock service
        mockService.shouldReturnError = true

        // Fetch countries
        viewModel.fetchCountries()

        // Handle asynchronously
        DispatchQueue.main.async {
            XCTAssertTrue(self.viewModel.countries.isEmpty, "Countries list should be empty on failure")
            XCTAssertNotNil(self.viewModel.errorMessage, "Error message should be set on failure")
            expectation.fulfill()  // Signal that the test can continue
        }

        // Wait for expectations (max 1 second)
        waitForExpectations(timeout: 1)
    }
}

// Mock service to inject into the ViewModel
class MockCountryService: CountryService {
    var shouldReturnError = false

    override func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "MockError", code: -1, userInfo: nil)))
        } else {
            let sampleCountry = Country(name: Country.Name(common: "France"),
                                        flags: Country.Flag(png: ""),
                                        region: "Europe",
                                        population: 67_000_000,
                                        capital: ["Paris"])
            completion(.success([sampleCountry]))
        }
    }
}
