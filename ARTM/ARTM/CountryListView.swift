//
//  CountryListView.swift
//  ARTM
//
//  Created by Chris Comeau on 2025-02-03.
//

import SwiftUI

struct CountryListView: View {
    @StateObject private var viewModel = CountryListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.countries) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    HStack {
                        AsyncImage(url: URL(string: country.flags.png)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 40, height: 30)
                        .clipShape(RoundedRectangle(cornerRadius: 5))

                        Text(country.name.common)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle(Text("countries_list_title".localized))
            .onAppear {
                viewModel.fetchCountries()
            }
            .alert(isPresented: $viewModel.showError) {
                Alert(
                    title: Text("error_title".localized),
                    message: Text(viewModel.errorMessage ?? "error_unknown".localized),
                    dismissButton: .default(Text("ok_button".localized))
                )
            }
        }
    }
}
