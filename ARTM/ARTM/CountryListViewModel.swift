//
//  CountryListModel.swift
//  ARTM
//
//  Created by Chris Comeau on 2025-02-03.
//

import SwiftUI
import Combine

class CountryListViewModel: ObservableObject {
    @Published var countries: [Country] = []
    @Published var errorMessage: String?
    @Published var showError: Bool = false

    private let service = CountryService()

    func fetchCountries() {
        service.fetchCountries { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let countries):
                    self?.countries = countries.sorted { $0.name.common < $1.name.common }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showError = true
                }
            }
        }
    }
}
