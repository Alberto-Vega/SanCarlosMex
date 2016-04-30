//
//  FourSquareService.swift
//  DeciderApp
//
//  Created by Alberto Vega Gonzalez on 2016.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

let foursquareAPIClientID = "C20JVM0GH2IVU1FA4MZV2GBYP1040GYUSAO5HT2K2AC32RF2"
let foursquareAPIClientSecret = "54HG0YGMDQHTCTC0SE1IXXKY5SD3244PK204EWPHXLEOQU4O"
let foursquareVenueSearchURL = "https://api.foursquare.com/v2/venues/search"
let foursquareImageRequestURL = "https://api.foursquare.com/v2/venues/"
//https://api.foursquare.com/v2/venues/search?sw=27.924982, -111.132005&ne=28.031358, -110.951605&intent=browse&query=restaurant&oauth_token=CQUHLVFES3OP4FW00TROO2EDW43SQA2PZQUDAHV1RFNXI3ZC&v=20160214



let cfLatLong = "27.9598417,-111.0571345"
let sw = "27.924982,-111.132005"
let ne = "28.031358,-110.951605"
let apiVersion = "20160214"

class FourSquareService {
    
    class func fetchVenueImage(venueID: String, completion: (success: Bool, data: NSData?)->()) {
        let urlString = "\(foursquareImageRequestURL)\(venueID)/photos?client_id=\(foursquareAPIClientID)&client_secret=\(foursquareAPIClientSecret)&v=\(apiVersion)&limit=1"
        guard let url = NSURL(string: urlString) else { return }
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                completion(success: true, data: data)
            }
            if let _ = error {
                if let response = response as? NSHTTPURLResponse {
                    print("Error fetching image: \(response.statusCode)")
                }
                completion(success: false, data: nil)
            }
            }.resume()
    }
    
    class func fetchImageFromFetchRequest(requestData: NSData, completion: (success: Bool, image: UIImage?)->()) {
        do {
            if let root = try NSJSONSerialization.JSONObjectWithData(requestData, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] {
                if let response = root["response"] as? [String : AnyObject], photos = response["photos"] as? [String : AnyObject], items = photos["items"] as? [[String : AnyObject]], photo = items.first, prefix = photo["prefix"] as? String, suffix = photo["suffix"] as? String {
                    let imageURLString = "\(prefix)100x100\(suffix)"
                    guard let imageURL = NSURL(string: imageURLString) else {
                        completion(success: false, image: nil)
                        return
                    }
                    let queue = NSOperationQueue()
                    queue.addOperationWithBlock({ () -> Void in
                        guard let imageData = NSData(contentsOfURL: imageURL), image = UIImage(data: imageData) else {
                            completion(success: false, image: nil)
                            return
                        }
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            completion(success: true, image: image)
                        })
                    })
                }
            }
        } catch {}
        completion(success: false, image: nil)
    }
    
    class func fetchImageFromFetchRequest(requestData: NSData, imageDimensions: String, completion: (success: Bool, image: UIImage?)->()) {
        do {
            if let root = try NSJSONSerialization.JSONObjectWithData(requestData, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] {
                if let response = root["response"] as? [String : AnyObject], photos = response["photos"] as? [String : AnyObject], items = photos["items"] as? [[String : AnyObject]], photo = items.first, prefix = photo["prefix"] as? String, suffix = photo["suffix"] as? String {
                    let imageURLString = "\(prefix)\(imageDimensions)\(suffix)"
                    guard let imageURL = NSURL(string: imageURLString) else {
                        completion(success: false, image: nil)
                        return
                    }
                    let queue = NSOperationQueue()
                    queue.addOperationWithBlock({ () -> Void in
                        guard let imageData = NSData(contentsOfURL: imageURL), image = UIImage(data: imageData) else {
                            completion(success: false, image: nil)
                            return
                        }
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            completion(success: true, image: image)
                        })
                    })
                }
            }
        } catch {}
        completion(success: false, image: nil)
    }
    
    class func searchVenues(queryString: String, completion: (success: Bool, data: NSData?)->()) {
        
//        let urlString = "\(foursquareVenueSearchURL)?client_id=\(foursquareAPIClientID)&client_secret=\(foursquareAPIClientSecret)&ll=\(cfLatLong)&v=\(apiVersion)&query=\(queryString)"
        
        //https://api.foursquare.com/v2/venues/search?sw=27.924982, -111.132005&ne=28.031358, -110.951605&intent=browse&query=restaurant&oauth_token=CQUHLVFES3OP4FW00TROO2EDW43SQA2PZQUDAHV1RFNXI3ZC&v=20160214
       // https://api.foursquare.com/v2/venues/search?sw=27.924982, -111.132005&ne=28.031358, -110.951605&intent=browse&query=restaurant&oauth_token=CQUHLVFES3OP4FW00TROO2EDW43SQA2PZQUDAHV1RFNXI3ZC&v=20160215
        
        let urlString = "\(foursquareVenueSearchURL)?client_id=\(foursquareAPIClientID)&client_secret=\(foursquareAPIClientSecret)&sw=\(sw)&ne=\(ne)&intent=browse&v=\(apiVersion)&query=\(queryString)"
        
        
        print(urlString)
        guard let url = NSURL(string: urlString) else { return }
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                completion(success: true, data: data)
                print("Request received data")
            }
            if let _ = error {
                if let response = response as? NSHTTPURLResponse {
                    print("Error with code: \(response.statusCode)")
                    completion(success: false, data: nil)
                }
            }
            }.resume()
    }
    
    class func parseVenueResponse(data: NSData, completion: (success: Bool, venues: [Restaurant]?)->()) {
        do {
            guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] else { return }
            guard let response = json["response"] as? [String : AnyObject] else { return }
            guard let venues = response["venues"] as? [[String: AnyObject]] else { return }
                        var venueArray = [Restaurant]()
                        for venue in venues {
                            if let name = venue["name"] as? String, location = venue["location"] as? [String : AnyObject], lat = location["lat"] as? Double, long = location["lng"] as? Double {
                                
                            
                                
                                    var venue = Restaurant(name: name, shortDescription: "", address: "", features: "", hours: "", notes: "", image: "", latitude: lat, longitude: long, cuisine: "", phone: "")
                                
                                if  let address = location["address"] as? String {
                                    venue.address = address
                                }
                                
                                    //                                let venue = Venue(fourSquareID: id, name: name, address: address, latitude: lat, longitude: long, imageURL: "", categories: "", distance: distance, ratingImageURL: "", reviewCount: userCount, votes: 0)
                                    venueArray.append(venue)
                                

                            }
                                
                        }
                        if venueArray.count > 0 {
                            completion(success: true, venues: venueArray)
                        }
                    
                
            
        } catch {}
        completion(success: false, venues: nil)
    }
}
