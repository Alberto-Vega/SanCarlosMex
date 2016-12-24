//
//  Hotel.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/15/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//
//
//import UIKit
//import MapKit

//class Hotel: PointOfInterest {
//    
//    var stars: Int
//    var phone: String
//    var accomodations: String
//    var services: String
//    
//    init?(name: String, shortDescription: String, address: String, features: String, hours: String, notes: String, image: String, coordinate: CLLocationCoordinate2D, stars: Int, phone: String, accomodations: String, services: String) {
//        self.stars = stars
//        self.phone = phone
//        self.accomodations = accomodations
//        self.services = services
//        super.init(name: name, shortDescription: shortDescription, address: address, features: address, hours: hours, notes: notes, image: image, coordinate: coordinate)
//    }
//}


import Foundation

class Hotel {
    let name:String?
    let id: String?
    let starRating: String?
    let hotelGuestRating: String?
    let distance: Double?
    var featuredImageUrl: String?
    let thumbnailImageUrl: String?
    var thumbnailImageUrlList: [String]?
    let address: String?
    let latitude: String?
    let longitude: String?
    let longDescription: String?
    let city: String?
    let hotelStateProvince: String?
    let deepLinkUrl: String?
    
    //    init(name:String?, id: String?, starRating: String?, hotelGuestRating: String?, distance:Double?, thumbnailImageUrl: String?, featuredImage:String?) {
    //        self.name = name
    //        self.starRating = starRating
    //        self.hotelGuestRating = hotelGuestRating
    //        self.distance = distance
    //        self.id = id
    //        self.address = nil
    //        self.longDescription = nil
    //        self.city = nil
    //        self.hotelStateProvince = nil
    //        self.featuredImageUrl = nil
    //        self.thumbnailImageUrl = thumbnailImageUrl
    //        self.thumbnailImageUrlList = nil
    //        self.deepLinkUrl = nil
    //        self.latitude = nil
    //        self.longitude = nil
    //    }
    
    init?(initWithDictionary dictionary: [String: AnyObject]) {
        guard let name = dictionary["name"] as? String, let hotelId = dictionary["hotelId"] as? String, let starRating = dictionary["hotelStarRating"] as? String, let hotelGuestRating = dictionary["hotelGuestRating"] as? String, let thumbImageUrl = dictionary["thumbnailUrl"] as? String, let distanceInMiles = dictionary["proximityDistanceInMiles"] as? String else { print("Initializing hotel instances from hotels dictionary failed"); return nil }
        self.name = name
        self.id = hotelId
        self.distance = Double(distanceInMiles)
        self.starRating = starRating
        self.hotelGuestRating = hotelGuestRating
        self.thumbnailImageUrl = "http://images.travelnow.com\(thumbImageUrl)"
        self.featuredImageUrl = nil
        self.longDescription = nil
        self.address = nil
        self.city = nil
        self.hotelStateProvince = nil
        self.thumbnailImageUrlList = nil
        self.deepLinkUrl = nil
        self.longitude = nil
        self.latitude = nil
    }
    
    init?(initWithIdDictionary IdDictionary: [String: AnyObject]) {
        guard let name =
            IdDictionary["hotelName"] as? String, let hotelId = IdDictionary["hotelId"] as? String, let starRating = IdDictionary["hotelStarRating"] as? String, let hotelGuestRating = IdDictionary["hotelGuestRating"] as? String, let hotelAddress = IdDictionary["hotelAddress"] as? String, let longDescription = IdDictionary["longDescription"] as? String, let hotelCity = IdDictionary["hotelCity"] as? String, let hotelStateProvince = IdDictionary["hotelStateProvince"] as? String, let latitude = IdDictionary["latitude"] as? String, let longitude = IdDictionary["longitude"] as? String, let photos = IdDictionary["photos"] as? [[String: AnyObject]], let deepLinkUrl = IdDictionary["deepLinkUrl"] as? String else { print("Initialing hotel instances from hotels IdDictionary failed"); return nil }
        let cssHeader = "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"></head>"
        let headEmbeddedCss = "<html><head><style type=\"text/css\"> body { font-family: Montserrat-Regular; background-color: #F2F0F0; color: #626060; margin-left: 20px; margin-right: 20px } </style></head>"
        self.thumbnailImageUrlList = [String](repeating: " ", count: photos.count)
        for index in 0..<photos.count {
            let url = "http://images.travelnow.com" + (photos[index]["url"] as! String)
            if photos[index]["displayText"] as? String == "Featured Image" || index == 0 {
                self.featuredImageUrl = url
            }
            if thumbnailImageUrlList != nil {
                thumbnailImageUrlList![index] = url
            }
        }
        self.name = name
        self.id = hotelId
        self.distance = nil
        self.starRating = starRating
        self.hotelGuestRating = hotelGuestRating
        self.thumbnailImageUrl = "http://images.travelnow.com"
        self.longDescription = headEmbeddedCss + "<body>" + longDescription + "<body>"
        self.address = hotelAddress
        self.city = hotelCity
        self.hotelStateProvince = hotelStateProvince
        self.deepLinkUrl = deepLinkUrl
        self.longitude = longitude
        self.latitude = latitude
    }
}

//    extension Hotel {
//        class func getHotelWithId(id: String?, completion: (hotel: Hotel?)-> Void) {
//            guard let id = id else { print("Hotel id string is nil"); return }
//            ExpediaAPI.getHotelDetailsBy(id) { (success, data) in
//                guard let data = data else { print("Current hotel data returned in the closure is nil error"); return }
//
//                if let  hotel = ExpediaJSONService.parseHotelSearchById(data) {
//                    dispatch_async(dispatch_get_main_queue()) {
//                        completion(hotel: hotel)
//                    }
//                } else {
//                    dispatch_async(dispatch_get_main_queue()) {
//                        completion(hotel: nil)
//                    }
//                }
//            }
//        }
//    }

