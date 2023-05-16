//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation

extension Country {
    struct Name: Codable, Hashable, Equatable {
        
        var common: String
        var official: String
        
        enum CodingKeys: CodingKey {
            case official
            case common
        }
    }
}
