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
    
    var arrayOfTestPOI: [PointOfInterest] = []
    
    override func setUp() {
        super.setUp()
        setupPointsOfInterest()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testActivityInitialization() {
        //Success cases.
        let potentialActivity = Activity(name: "Test Activity", image: UIImage(named: "delfines.jpg"))
        
        XCTAssertNotNil(potentialActivity)
        
        let noPhoto = Activity(name: "No photo Activity", image: nil)
        XCTAssertNotNil(noPhoto)

    }
    
    func testCategoryInitialization() {
        
        let potentialCategory = Category(name:"Test", image: "delfines.jpg", pointsOfInterest: arrayOfTestPOI)
        
        XCTAssert(potentialCategory.pointsOfInterest?.count == 1 )
        XCTAssert(potentialCategory.name == "Test")
        XCTAssert(potentialCategory.pointsOfInterest![0].name == "No Coordinate POI")
        XCTAssertNotNil(potentialCategory)
    }
    
    
    func setupPointsOfInterest() {
        
    // Helper function to test CategoryInitialization.
        
        let potentialPointOfInterest = PointOfInterest(name: "No Coordinate POI", shortDescription: "No Coordinate POI", address: "Cupertino Road 123, Seattle, WA", features: "No Coordinate POI", hours: "No Coordinate POI", notes: "No Coordinate POI", image: "NoCoordinatePOI.jpg", latitude: 41.40338, longitude: 2.17403)
        arrayOfTestPOI.append(potentialPointOfInterest)
    }
    
    func testPointOfInterstInitialization() {
        // Success case.
        
        let potentialPointOfInterest = PointOfInterest(name: "No Coordinate POI", shortDescription: "No Coordinate POI", address: "Cupertino Road 123, Seattle, WA", features: "No Coordinate POI", hours: "No Coordinate POI", notes: "No Coordinate POI", image: "NoCoordinatePOI.jpg", latitude: 41.40338, longitude: 2.17403)
        XCTAssertNotNil(potentialPointOfInterest)
    }
    
    func testRestaurantInitialization() {
        // Success case.
       let potentialRestaurant = Restaurant(name: "Piccolo", shortDescription: "Italian Food", address: "Beltrones Avenue, San Carlos, Mexico", features: "Not only is the food really good, but the atmosphere is cozy and inviting.", hours: "Wed - Sat 6:30 pm - 11:00 pm", notes: "Great food and good service.", image: "piccolo.jpg",latitude: 27.9603909, longitude: -111.0347736, cuisine: "Italian", phone: "622-226-0503")
        XCTAssertNotNil(potentialRestaurant)
    }
    
    func testBeachInitialization() {
        let potentialBeach = Beach(name: "Potential Beach", shortDescription: "Semi-Private Beach", address: "Test Beach", features: "This is a great place to snorkel, dive, swim and kayak. It is a beautiful quiet area.", hours: "No hour restrictions", notes: "This is just a test beach", image: "kayaking.JPG",latitude: 27.9466385, longitude: -111.0613993, experience: "test beach")
        XCTAssertNotNil(potentialBeach)
    }
    
    func testHotelInitialization() {
        let potentialHotel = Hotel(name: "Test Hotel", shortDescription: "Test Hotel", address: "Test Hotel Address", features: "This is just a test Hotel", hours: "Test Hotel hours", notes: "This is just a test Hotel", image: "kayaking.JPG", latitude: 27.9466385, longitude: -111.0613993, stars: 4, phone: "Test Hotel phone", accomodations: "Test Hotel Accomodations", services: "Test Hotel Services")
        XCTAssertNotNil(potentialHotel)
    }
    
    func testAdventureInitialization() {
        let potentialAdventure = Adventure(name: "Test Adventure", shortDescription: "Test Adventure description", address: "Test adventure address", features: "Test Adventure Features", hours: "Test Adventure hours", notes: "Test Adventure notes", image: "kayaking.JPG",latitude: 27.9466385, longitude: -111.0613993, experience: "Test Adventure Experience", details: "Test Adventure details", preparations: "Preparations for Test Adventure", requirements: "Test Adventure")
        XCTAssertNotNil(potentialAdventure)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
