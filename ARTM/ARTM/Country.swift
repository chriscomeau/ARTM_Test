//
//  Country.swift
//  ARTM
//
//  Created by Chris Comeau on 2025-02-03.
//

import Foundation

struct Country: Decodable, Identifiable {
    var id: String { name.common }  // Unique identifier based on country name
    let name: Name
    let flags: Flag
    let region: String
    let population: Int
    let capital: [String]?

    struct Name: Decodable {
        let common: String
    }

    struct Flag: Decodable {
        let png: String
    }
}
