//
//  Category.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/17/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class Category {
  var name: String
  var image = UIImage(contentsOfFile: "")
  var pointsOfInterest = [PointOfInterest]()
  
  init(name: String, image: String, pointsofInterest: [PointOfInterest]) {
    self.name = name
    
    self.image = UIImage(contentsOfFile: image)
    self.pointsOfInterest += pointsOfInterest

  }
  
}
