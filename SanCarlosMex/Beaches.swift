//
//  Beaches.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/15/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit
import MapKit


class Beach: PointOfInterest {
    
    var experience: String
    init(name: String, shortDescription: String, address: String, features: String, hours: String, notes: String, image: String, coordinate: CLLocationCoordinate2D, experience: String) {
        
        self.experience = experience
        super.init(name: name, shortDescription: shortDescription, address: address, features: features, hours: hours, notes: notes, image: image, coordinate: coordinate)
    }
}
