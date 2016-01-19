//
//  PointOf.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/15/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit
import MapKit

class PointOfInterest {
    
    let name, shortDescription, address, features, hours, notes: String
    var image:UIImage?
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, shortDescription: String, address: String, features: String, hours: String, notes: String, image: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.shortDescription = shortDescription
        self.address = address
        self.features = features
        self.hours = hours
        self.notes = notes
        self.image = UIImage(named: image)
        self.coordinate = coordinate
    }
}

