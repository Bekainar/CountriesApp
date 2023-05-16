//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation

extension Country {
    struct Flag: Codable, Hashable, Equatable {
        
        var png: URL
        
        enum CodingKeys: CodingKey {
            case png
        }
    }
}

