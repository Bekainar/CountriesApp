//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation

extension Country {
    static let italy = Country(
        name: .init(common: "Italy", official: "Italian Republic"),
        continent: .europe,
        capital: .init(
            name: "Rome",
            location: .init(latitude: 41.9, longitude: 12.48)
        ),
        timezones: ["GMT +5"],
        location: .init(latitude: 42.83333333, longitude: 12.83333333),
        currencies: [.init(name: "Euro", symbol: "€", ISO4217: "EUR")],
        languages: ["Italian"],
        area: 301336.0,
        population: 59554023,
        flags: .init(
            png: URL(string: "https://flagcdn.com/w320/it.png")!
        )
    )
}
