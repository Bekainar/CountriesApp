//
//  CLLocationCoordinate2D+Equatable.swift
//  Strong
//
//  Created by Bekainar on 15.05.2023.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
