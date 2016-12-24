//
//  Expedia.swift
//  Expedia
//
//  Created by Alberto Vega Gonzalez on 8/18/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

//
//  ExpediaAPI.swift
//  abscond
//
//  Created by Alberto Vega Gonzalez on 1/29/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation
import CoreLocation

let expediaAPIClientID = "GqMZHt4I7n2m3gdbT7fFBvAWnBACcLw1"
let expediaHotelSearchByCityURL = "http://terminal2.expedia.com/x/mhotels/search"
let expediaHotelSearchByLatitudeLongitude = "http://terminal2.expedia.com/x/hotels"
let hotelIdReviewSearchUrl = "http://terminal2.expedia.com/x/reviews/hotels"
let hotelDetailsByIdUrl = "http://terminal2.expedia.com:80/x/mhotels/info"
// http://terminal2.expedia.com/x/mhotels/search?city=SEATTLE&checkInDate=2016-12-01&checkOutDate=2016-12-03&room1=2&apikey=GqMZHt4I7n2m3gdbT7fFBvAWnBACcLw1

class ExpediaAPI {
    class func searchHotelsBy(location:CLLocation, completion: @escaping (_ success: Bool, _ data: NSData?)->()) {
        let urlString = "\(expediaHotelSearchByLatitudeLongitude)?location=\(location.coordinate.latitude),\(location.coordinate.longitude)&radius=5km&prettyPrint=true&apikey=\(expediaAPIClientID)"
        print(urlString)
        guard let url = NSURL(string: urlString) else { return }
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let error = error {
                OperationQueue.main.addOperation({
                    print(error.localizedDescription)
                })
                if let urlResponse = response as? HTTPURLResponse {
                    print("Error with code: \(urlResponse.statusCode)")
                } else {
                    print(response)
                }
            }
            if let data = data {
                OperationQueue.main.addOperation({
                    completion(true, data as NSData?)
                })
            } else {
                OperationQueue.main.addOperation({
                    completion(false, nil)
                })
            }
            
        }
        session.resume()
    }
    // I'm hardcoding the checkInDate and checkOut date for testing purposes.
    class func searchHotelsBy(city:String, checkInDate: String, checkOutDate: String, room: String, completion: @escaping (_ success: Bool, _ data: NSData?)->()) {
        let urlString = "\(expediaHotelSearchByCityURL)?city=\(city)&checkInDate=\(checkInDate)&checkOutDate=\(checkOutDate)&room1=\(room)&prettyPrint=true&resultsPerPage=75&apikey=\(expediaAPIClientID)"
        print(urlString)
        guard let url = NSURL(string: urlString) else { return }
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
                if let urlResponse = response as? HTTPURLResponse {
                    print("Error with code: \(urlResponse.statusCode)")
                } else {
                    print(response)
                }
            }
            if let data = data {
                OperationQueue.main.addOperation({
                    completion(true, data as NSData?)
                })
            } else {
                OperationQueue.main.addOperation({
                    completion(false, nil)
                })
            }
        }
        session.resume()
    }
    // Needs to be tested.
    /*
     http:terminal2.expedia.com/x/reviews/hotels?hotelId=36514&summary=false&sortBy=DATEDESCWITHLANGBUCKETS&items=5&apikey=GqMZHt4I7n2m3gdbT7fFBvAWnBACcLw1 */
    
    class func getHotelReviewsBy(hotelId: String, completion: @escaping (_ success: Bool, _ data: NSData?)->()) {
        let urlString = "\(hotelIdReviewSearchUrl)?hotelId=\(hotelId)&summary=false&sortBy=DATEDESCWITHLANGBUCKETS&items=5&apikey=\(expediaAPIClientID)"
        print(urlString)
        guard let url = NSURL(string: urlString) else { return }
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
                if let urlResponse = response as? HTTPURLResponse {
                    print("Error with code: \(urlResponse.statusCode)")
                } else {
                    print(response)
                }
            }
            if let data = data {
                OperationQueue.main.addOperation({
                    completion(true, data as NSData?)
                })
            } else {
                OperationQueue.main.addOperation({
                    completion(false, nil)
                })
            }
        }
        session.resume()
    }
    /*    http://terminal2.expedia.com:80/x/mhotels/info?hotelId=15490
     
     */
    
    class func getHotelDetailsBy(hotelId: String, completion: @escaping (_ success: Bool, _ data: NSData?)->()) {
        let urlString = "\(hotelDetailsByIdUrl)?hotelId=\(hotelId)&apikey=\(expediaAPIClientID)"
        print(urlString)
        guard let url = NSURL(string: urlString) else { return }
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
                if let urlResponse = response as? HTTPURLResponse {
                    print("Error with code: \(urlResponse.statusCode)")
                } else {
                    print(response)
                }
            }
            if let data = data {
                OperationQueue.main.addOperation({
                    completion(true, data as NSData?)
                })
            } else {
                OperationQueue.main.addOperation({
                    completion(false, nil)
                    
                })
            }
        }
        session.resume()
    }
}

