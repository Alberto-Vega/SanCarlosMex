//
//  Review+Services.swift
//  Expedia
//
//  Created by Alberto Vega Gonzalez on 9/6/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

extension Review {
    class func getReviewsByHotelId(id: String?, completion: @escaping ([Review]?)-> ()) {
        guard let id = id else {return}
        ExpediaAPI.getHotelReviewsBy(hotelId: id) { (success, data) in
            guard let data = data else { print("Review Data is Nil");return }
            guard let reviews = ExpediaJSONService.parseReviewsByHotelId(JSON: data) else { print( "Failed parsing reviews Dictionary"); return }
            DispatchQueue.main.async {
                completion(reviews)
            }
        }
    }
}
