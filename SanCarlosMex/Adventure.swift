//
//  Adventures.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/15/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class Adventure: PointOfInterest {
  var experience: String
  var details: String
  var preparations: String
  var requirements: String
  
  init(name: String, description: String, address: String, features: String, hours: String, notes: String, image: String, experience: String, details: String, preparations: String, requirements: String) {
    
    self.experience = experience
    self.details = details
    self.preparations = preparations
    self.requirements = requirements
    
    super.init(name: name, description: description, address: address, features: features, hours: hours, notes: notes, image: image)
  }
}
