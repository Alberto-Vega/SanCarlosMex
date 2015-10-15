//
//  Restaurant.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 7/14/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class Restaurant {
  var name: String
  var address: String
  var image: UIImage?
  
  init(name: String, address: String, image: UIImage) {
    self.name = name
    self.address = address
    self.image = image
  }
}
