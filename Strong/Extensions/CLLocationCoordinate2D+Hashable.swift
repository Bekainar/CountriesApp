//
//  CLLocationCoordinate2D+Hashable.swift
//  Strong
//
//  Created by Bekainar on 15.05.2023.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.latitude)
        hasher.combine(self.longitude)
    }
}
