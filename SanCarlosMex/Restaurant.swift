//
//  Restaurant.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 7/14/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit
import MapKit

class Restaurant: PointOfInterest {
    
    var cuisine: String
    var phone: String
    
    init(name: String, shortDescription: String, address: String, features: String, hours: String, notes: String, image: String, coordinate: CLLocationCoordinate2D, cuisine: String, phone: String) {
        
        self.cuisine = cuisine
        self.phone = phone
        
        super.init(name: name, shortDescription: shortDescription, address: address, features: features, hours: hours, notes: notes, image: image, coordinate: coordinate)
    }
}
