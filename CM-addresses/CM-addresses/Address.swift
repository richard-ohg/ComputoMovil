//
//  Address.swift
//  CM-addresses
//
//  Created by 2020-1 on 10/9/19.
//  Copyright © 2019 ios. All rights reserved.
//

import Foundation
import MapKit

class Address: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(title: String, subtitle: String, location: CLLocationCoordinate2D) {
        self.title = title;
        self.subtitle = subtitle;
        self.coordinate = location
        
    }
    
}
