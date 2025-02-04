//
//  ARTMTests.swift
//  ARTMTests
//
//  Created by Chris Comeau on 2025-02-03.
//

import XCTest
@testable import ARTM

class CountryServiceTests: XCTestCase {
    
    var service: CountryService!
    
    override func setUp() {
        super.setUp()
        service = CountryService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testFetchCountriesSuccess() {
        let expectation = self.expectation(description: "Fetch countries success")
        
        // Simulate successful network response
        service.fetchCountries { result in
            switch result {
            case .success(let countries):
                XCTAssertFalse(countries.isEmpty, "Countries list should not be empty")
            case .failure:
                XCTFail("Expected success but got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
    
    func testFetchCountriesFailure() {
        let expectation = self.expectation(description: "Fetch countries failure")
        
        // Simulate a failure by pointing to an invalid URL or injecting a mocked error
        let invalidService = CountryServiceWithMockFailure()
        
        invalidService.fetchCountries { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertNotNil(error, "Error should not be nil")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
}

// Simulated service for testing failure scenario
class CountryServiceWithMockFailure: CountryService {
    override func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        completion(.failure(NSError(domain: "TestError", code: -1, userInfo: nil)))
    }
}
