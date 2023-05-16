//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import UIKit
import Foundation
import CoreLocation

extension Country {
    struct Capital: Decodable, Hashable{
        
        var name: String
        var location: CLLocationCoordinate2D
        
        init(name: String, location: CLLocationCoordinate2D) {
            self.name = name
            self.location = location
        }
        
        init(from decoder: Decoder) throws {
            
            let root = try decoder.container(keyedBy: CodingKeys.self)
            
            do {
                name = try root
                    .decode([String].self, forKey: .name)
                    .first ?? ""
            } catch {
                throw Errors.missingKey("capital")
            }
            
            do {
                let latlng = try root
                    .nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .location)
                    .decode([CLLocationDegrees].self, forKey: .latlng)
                
                location = .init(latitude: latlng[0], longitude: latlng[1])
            } catch {
                throw Errors.missingKey("capitalInfo-latlng")
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case name = "capital"
            case location = "capitalInfo"
        }
        
        enum AdditionalInfoKeys: String, CodingKey {
            case latlng = "latlng"
        }
    }
}

extension Country.Capital: Equatable {
    static func == (lhs: Country.Capital, rhs: Country.Capital) -> Bool {
        lhs.name == rhs.name &&
        lhs.location == rhs.location
    }
}
