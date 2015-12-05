//
//  Hotel.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/15/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class Hotel: PointOfInterest {
    
    var stars: Int
    var phone: String
    var accomodations: String
    var services: String
    
    init(name: String, shortDescription: String, address: String, features: String, hours: String, notes: String, image: String, stars: Int, phone: String, accomodations: String, services: String) {
        self.stars = stars
        self.phone = phone
        self.accomodations = accomodations
        self.services = services
        super.init(name: name, shortDescription: shortDescription, address: address, features: address, hours: hours, notes: notes, image: image)
    }
}
