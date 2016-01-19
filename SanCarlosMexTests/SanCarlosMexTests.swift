//
//  SanCarlosMexTests.swift
//  SanCarlosMexTests
//
//  Created by Alberto Vega Gonzalez on 1/18/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import MapKit
import XCTest

@testable import SanCarlosMex

class SanCarlosMexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testPointOfInterstInitialization() {
        // Success case.
        
        let potentialPointOfInterest = PointOfInterest(name: "No Coordinate POI", shortDescription: "No Coordinate POI", address: "Cupertino Road 123, Seattle, WA", features: "No Coordinate POI", hours: "No Coordinate POI", notes: "No Coordinate POI", image: "NoCoordinatePOI.jpg", coordinate: CLLocationCoordinate2D(latitude: 41.40338, longitude: 2.17403))
        XCTAssertNotNil(potentialPointOfInterest)
    }
    
    func testRestaurantInitialization() {
        // Success case.
       let potentialRestaurant = Restaurant(name: "Piccolo", shortDescription: "Italian Food", address: "Beltrones Avenue, San Carlos, Mexico", features: "Not only is the food really good, but the atmosphere is cozy and inviting.", hours: "Wed - Sat 6:30 pm - 11:00 pm", notes: "Great food and good service.", image: "piccolo.jpg",coordinate: CLLocationCoordinate2D(latitude: 27.9603909, longitude: -111.0347736), cuisine: "Italian", phone: "622-226-0503")
        XCTAssertNotNil(potentialRestaurant)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
