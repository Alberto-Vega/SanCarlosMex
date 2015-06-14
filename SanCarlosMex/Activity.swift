//
//  Activity.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 6/12/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//
import Foundation
import UIKit

struct Activity {
  var name = " "
  var image = UIImage(named: "")
  
  func randomDescription() -> String  {
    let randomNumber = Int(arc4random_uniform(UInt32(6)))
    var randomDescription:String
    
    if randomNumber == 0  {
      randomDescription = "San Carlos is one of the main tourist attractions in the state of Sonora, Mexico."
    } else if randomNumber == 1 {
      randomDescription = "It is located by the Sea of Cortez in the northwest of Mexico. 154 Miles from the border with United States (state of Arizona)."
    } else if randomNumber == 2 {
      randomDescription = "This is a lovely Mexican resort that offers something for everyone. For water sports enthusiasts, there are beautiful sand beaches, spectacular diving and snorkeling, kayaking, and offshore fishing."
    } else if randomNumber == 3 {
      randomDescription = "Summer water temperatures can reach well into the 80’s and visibility can be 100 percent or more."
    } else if randomNumber == 4 {
      randomDescription = "Visitors are able to practice different type of activities as diving, fishing, snorkeling, windsurfing, swimming, deep-sea diving, hiking and ground sports such as volleyball, football or softball at various recreational facilities."
    } else{
      randomDescription = "Crystal clear and constantly calm waters provide an incredible showcase for more than 800 species of maritime life."
    }
    return randomDescription
  }
  
  
}
