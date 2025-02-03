//
//  CountryDetailView.swift
//  ARTM
//
//  Created by Chris Comeau on 2025-02-03.
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: URL(string: country.flags.png)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 8))


            Text("name_label".localized(with: country.name.common))
                .font(.title)
                .padding(.bottom, 4)
            
            Text("region_label".localized(with: country.region))
                .font(.subheadline)
            
            Text("population_label".localized(with: country.population))
                .font(.subheadline)
            
            if let capital = country.capital?.first {
                Text("capital_label".localized(with: capital))
                    .font(.subheadline)
            } else {
                Text("capital_na_label".localized)
                    .font(.subheadline)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(country.name.common)
    }
}
