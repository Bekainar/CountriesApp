//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import SwiftUI

@main
struct StrongApp: App {
    
    @StateObject private var countriesManager: CountriesManager
    
    init() {
        let networkingService = NetworkingService()
        //INFO: dependency Injection of external Services (also for injecting mocked services)
        _countriesManager = StateObject(
            wrappedValue: CountriesManager(networkingService: networkingService)
        )
    }
    
    var body: some Scene {
        WindowGroup {
            CountriesList()
                .environmentObject(countriesManager)
        }
    }
}
