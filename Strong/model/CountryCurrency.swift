//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation

extension Country {
    struct Currency: Decodable, Hashable, Equatable {
        
        var name: String
        var symbol: String
        var ISO4217: String?
        
        enum CodingKeys: CodingKey {
            case name
            case symbol
        }
    }
}
