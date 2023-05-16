//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation

@MainActor
final class CountriesManager: ObservableObject {
    //MARK: - Services(DI)
    let networkingService: NetworkingService
    //MARK: - ViewModel Properties
    @Published private(set) var countries: [Country] = []
    @Published private(set) var filteredCountries: [Country] = []
    //MARK: - Init
    init(networkingService: NetworkingService) {
        self.networkingService = networkingService
        Task {
            await loadCountries()
        }
    }
    //MARK: - Methods
    func loadCountries() async {
        do {
            countries = try await networkingService.fetchObject(for: RestCountries.all.url)
        } catch {
            print(error)
        }
    }
    
    func filterCountries(by continent: Country.Continent) {
        filteredCountries = countries.filter({ $0.continent == continent })
    }
    
    func filterCountries(by text: String) {
        filteredCountries = countries.filter({ $0.name.common.localizedCaseInsensitiveContains(text) })
    }
}

