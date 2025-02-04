//
//  CountryModelTests.swift
//  ARTM
//
//  Created by Chris Comeau on 2025-02-03.
//

import XCTest
@testable import ARTM

class CountryModelTests: XCTestCase {

    func testCountryWithoutCapital() {
        let countryWithoutCapital = Country(
            name: Country.Name(common: "Narnia"),
            flags: Country.Flag(png: ""),
            region: "Fantasy",
            population: 0,
            capital: nil
        )

        XCTAssertNil(countryWithoutCapital.capital, "Capital should be nil for countries without a capital.")
    }

    func testCountryWithEmptyFlagURL() {
        let countryWithEmptyFlag = Country(
            name: Country.Name(common: "Atlantis"),
            flags: Country.Flag(png: ""),
            region: "Mythical",
            population: 0,
            capital: ["Atlantis City"]
        )

        XCTAssertTrue(countryWithEmptyFlag.flags.png.isEmpty, "Flag URL should be empty.")
    }
}
