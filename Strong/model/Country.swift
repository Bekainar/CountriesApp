//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation
import CoreLocation

struct Country: Identifiable, Hashable {
    let id = UUID()
    var name: Name
    var continent: Continent
    var capital: Capital?
    var location: CLLocationCoordinate2D
    var currencies: [Currency] = []
    var languages: [String]?
    var area: Double
    var population: Int
    var flags: Flag
    var timezones: [String]?
    
    init(
        name: Name,
        continent: Continent,
        capital: Capital?,
        timezones: [String]? = nil,
        location: CLLocationCoordinate2D,
        currencies: [Currency],
        languages: [String]? = nil,
        area: Double,
        population: Int,
        flags: Flag
    ) {
        self.name = name
        self.continent = continent
        self.capital = capital
        self.location = location
        self.currencies = currencies
        self.languages = languages
        self.area = area
        self.population = population
        self.flags = flags
        self.timezones = timezones
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(name)
            hasher.combine(capital)
            hasher.combine(continent)
            hasher.combine(area)
            hasher.combine(population)
            hasher.combine(flags)
            hasher.combine(timezones)
        }
}






