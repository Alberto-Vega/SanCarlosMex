//
//  Hotel+Services.swift
//
//
//  Created by Alberto Vega Gonzalez on 9/6/16.
//
//

import Foundation

    extension Hotel {
        class func getHotelWithId(id: String?, completion: @escaping (_ hotel: Hotel?)-> Void) {
            guard let id = id else { print("Hotel id string is nil"); return }
            ExpediaAPI.getHotelDetailsBy(hotelId: id) { (success, data) in
                guard let data = data else { print("Current hotel data returned in the closure is nil error"); return }

                if let  hotel = ExpediaJSONService.parseHotelSearchById(JSON: data) {
                    DispatchQueue.main.async {
                        completion(hotel)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }
        }
    }

