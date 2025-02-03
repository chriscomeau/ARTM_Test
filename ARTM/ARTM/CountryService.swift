//
//  CountryService.swift
//  ARTM
//
//  Created by Chris Comeau on 2025-02-03.
//

import Foundation

class CountryService {
    func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completion(.success(countries))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
