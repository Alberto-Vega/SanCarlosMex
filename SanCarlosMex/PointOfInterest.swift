//
//  PointOf.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/15/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class PointOfInterest {
  let name, description, address, features, hours, notes: String
  var image = UIImage(contentsOfFile: "")

  init(name: String, description: String, address: String, features: String, hours: String, notes: String, image: String) {
    self.name = name
    self.description = description
    self.address = address
    self.features = features
    self.hours = hours
    self.notes = notes
    self.image = UIImage(contentsOfFile: image)
  }
}

