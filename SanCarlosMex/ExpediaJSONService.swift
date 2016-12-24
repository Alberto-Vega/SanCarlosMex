//
//  ExpediaJSONService.swift
//  Expedia
//
//  Created by Alberto Vega Gonzalez on 8/20/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class ExpediaJSONService {
    class func parseHotelSearchByCity(JSON: NSData) -> [Hotel]? {
        var hotels = [Hotel]()
        do {
            guard let baseObject = try JSONSerialization.jsonObject(with: JSON as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject] else { print("JSON base object is nil"); return nil  }
            guard let hotelList = baseObject["hotelList"] as? [[String: AnyObject]] else { print("hotelList is nil"); return nil}
            
            for hotel in 0..<hotelList.count {
                guard let hotel = Hotel(initWithDictionary: hotelList[hotel]) else { print("parsing hotels from hotels list dictionary failed"); return nil }
            hotels.append(hotel)
            }
        } catch {
            print("json error: \(error)")
        }
        return hotels
    }
    
    
    class func parseHotelSearchByLocation(JSON: NSData) -> [Hotel]? {
        var hotels = [Hotel]()
        do {
            guard let baseObject = try JSONSerialization.jsonObject(with: JSON as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject] else { print("JSON base object is nil"); return nil  }
            guard let hotelList = baseObject["hotelList"] as? [[String: AnyObject]] else { print("hotelList is nil"); return nil}
            
            for hotel in 0..<hotelList.count {
                guard let hotel = Hotel(initWithDictionary: hotelList[hotel]) else { print("parsing hotels from hotels list dictionary failed"); return nil }
                hotels.append(hotel)
            }
        } catch {
            print("json error: \(error)")
        }
        return hotels
    }
    
    class func parseHotelSearchById(JSON: NSData) -> Hotel? {
        var hotel:Hotel?
        do {
            guard let baseObject = try JSONSerialization.jsonObject(with: JSON as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject] else { print("JSON base object is nil"); return nil  }
            
                guard let parsedHotel = Hotel(initWithIdDictionary: baseObject) else { print("parsing hotel from hotel dictionary failed"); return nil }
                hotel = parsedHotel
        } catch {
            print("json error: \(error)")
        }
        return hotel
        
    }
    
    class func parseReviewsByHotelId(JSON: NSData) -> [Review]? {
        var reviews:[Review] = [Review]()
        do {
            guard let baseObject = try JSONSerialization.jsonObject(with: JSON as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject] else { print("Reviews JSON base object is nil"); return nil  }
            guard let reviewDetails = baseObject["reviewDetails"] as? [String: AnyObject], let reviewCollection = reviewDetails["reviewCollection"] as? [String: AnyObject], let review = reviewCollection["review"] as? [[String: AnyObject]] else { print("parsing reviews from review base object failed"); return nil }
            for index in 0..<review.count {
                if let review = Review(initWithIdDictionary: review[index]) {
                reviews.append(review)
                }
            }
        } catch {
            print("json error: \(error)")
        }
        return reviews
        
    }
}
