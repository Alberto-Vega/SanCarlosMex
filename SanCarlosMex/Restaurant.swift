//
//  Restaurant.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 7/14/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class Restaurant: PointOfInterest {
  
  var cuisine: String
  var phone: String
  
  init(name: String, description: String, address: String, features: String, hours: String, notes: String, image: String, cuisine: String, phone: String) {
    
    self.cuisine = cuisine
    self.phone = phone
    
    super.init(name: name, description: description, address: address, features: features, hours: hours, notes: notes, image: image)
  }
}
