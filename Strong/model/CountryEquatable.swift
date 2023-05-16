//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//
import Foundation

extension Country: Equatable {
    static func == (lhs: Country, rhs: Country) -> Bool {
        
        lhs.name == rhs.name &&
        lhs.continent == rhs.continent &&
        lhs.capital == rhs.capital &&
//        lhs.location == rhs.location &&
//        lhs.tlds == rhs.tlds &&
        lhs.currencies == rhs.currencies &&
        lhs.timezones == rhs.timezones &&
        lhs.area == rhs.area &&
        lhs.population == rhs.population &&
        lhs.flags == rhs.flags
        
    }
}
