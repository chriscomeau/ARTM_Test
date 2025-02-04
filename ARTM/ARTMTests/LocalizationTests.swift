//
//  LocalizationTests.swift
//  ARTMTests
//
//  Created by Chris Comeau on 2025-02-03.
//

import XCTest

class LocalizationTests: XCTestCase {

    override func setUp() {
        super.setUp()

        // Force app to run in French. App targed already forced in french in scheme
        // Disabled, Instead changed language in testplan
        //UserDefaults.standard.set(["fr"], forKey: "AppleLanguages")
        //UserDefaults.standard.synchronize()
    }

    func testLocalizedNameLabel() {
        let countryName = "France"
        let localizedString = String(format: NSLocalizedString("name_label", comment: ""), countryName)
        XCTAssertEqual(localizedString, "Nom : France", "The localized string should correctly insert the country name.")
    }

    func testPopulationLabelWithInt() {
        let population = 67_000_000
        let localizedString = String(format: NSLocalizedString("population_label", comment: ""), population)
        XCTAssertEqual(localizedString, "Population : 67000000", "The population label should correctly format integers.")
    }

    func testLocalizationKeysExist() {
        let keys = ["countries_list_title", "error_title", "name_label", "population_label"]
        for key in keys {
            XCTAssertNotEqual(NSLocalizedString(key, comment: ""), key, "Localization key \(key) should have a corresponding translation.")
        }
    }
}
