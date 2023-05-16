//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import SwiftUI

struct CountriesList: View {

    @EnvironmentObject private var countriesManager: CountriesManager
    @State private var searchField: String = ""
    @State private var selectedContinent: Country.Continent = .all

    var body: some View {
        NavigationStack {
            if !countriesManager.countries.isEmpty {
                countriesListView
            } else {
                ProgressView("Loading")
            }
        }
        .navigationViewStyle(.stack)
    }

    private var countriesListView: some View {
        Group {
            List(
                countriesManager.filteredCountries.isEmpty
                    ? countriesManager.countries
                    : countriesManager.filteredCountries) { country in
                        NavigationLink(value: country) {
                            CountryRow(country: country)
                        }
            }
            .accessibilityIdentifier("countriesList")
            .navigationDestination(for: Country.self) { country in
                CountryDetails(country: country)
            }
        }
        .navigationTitle("World countries")
        .searchable(
            text: $searchField,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Country Search"
        )
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                continentsMenu
            }
        }
        .refreshable {
            await countriesManager.loadCountries()
        }
        .onChange(of: searchField) {
            $0.isEmpty ? countriesManager.filterCountries(by: selectedContinent) : countriesManager.filterCountries(by: $0)
        }
        .onChange(of: selectedContinent) {
            countriesManager.filterCountries(by: $0)
        }
    }

    private var continentsMenu: some View {
        Menu {
            Picker("Continents", selection: $selectedContinent) {
                ForEach(Country.Continent.allCases, id: \.self) { continent in
                    if continent != .none {
                        Text(continent.name).tag(continent)
                    }
                }
            }.pickerStyle(.inline)
        } label: {
            Text(selectedContinent.name)
        }
    }
}


struct CountriesList_Previews: PreviewProvider {
    static var previews: some View {
        CountriesList()
            .environmentObject(
                CountriesManager(networkingService: NetworkingService())
            )
    }
}

