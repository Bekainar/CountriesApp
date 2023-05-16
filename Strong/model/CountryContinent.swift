//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation

extension Country {
    enum Continent: String, CaseIterable, Hashable, Codable {
        case all
        case none
        case europe = "Europe"
        case africa = "Africa"
        case asia = "Asia"
        case oceania = "Oceania"
        case southAmerica = "South America"
        case northAmerica = "North America"
        case antarctica = "Antarctica"
        
        var name: String {
            switch self {
            case .all:
                return String(localized: "All")
            case .europe:
                return String(localized: "Europe")
            case .africa:
                return String(localized: "Africa")
            case .asia:
                return String(localized: "Asia")
            case .oceania:
                return String(localized: "Oceania")
            case .southAmerica:
                return String(localized: "South America")
            case .northAmerica:
                return String(localized: "North America")
            case .antarctica:
                return String(localized: "Antarctica")
            case .none:
                return ""
            }
        }
    }
}
