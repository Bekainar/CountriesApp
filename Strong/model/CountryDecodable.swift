//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation
import CoreLocation

extension Country: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let root = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try root.decode(Name.self, forKey: .name)
        area = try root.decode(Double.self, forKey: .area)
        population = try root.decode(Int.self, forKey: .population)
        flags = try root.decode(Flag.self, forKey: .flags)
//        code = try root.decode(String.self, forKey: .code)
        
        let latlng = try root.decode([CLLocationDegrees].self, forKey: .location)
        location = .init(latitude: latlng[0], longitude: latlng[1])
        
        continent = .init(
            rawValue: try root
                .decode([String].self, forKey: .continent)
                .first ?? ""
        ) ?? .none
        
        //MARK: - Catching errors for optionals values
        do {
            capital = try .init(from: decoder)
        } catch {
            print(Errors.missingKey("capital for \(self.name.common)"))
        }
        
        do {
            timezones = try root
                .decode([String : String].self, forKey: .timezones)
                .map(\.value)
        } catch {
            print(Errors.missingKey("timezones for \(self.name.common)"))
        }
        
        do {
            let currencies = try root
                .decode([String : Currency].self, forKey: .currencies)
            
            for (key, currency) in currencies {
                self.currencies.append(
                    Currency(name: currency.name, symbol: currency.symbol, ISO4217: key)
                )
            }
        } catch {
            print(Errors.missingKey("currencies for \(self.name.common)"))
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case continent = "continents"
        case capital
        case location = "latlng"
        case currencies
        case timezones
        case area
        case population
        case flags
    }
}
