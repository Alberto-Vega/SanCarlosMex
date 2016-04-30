//
//  FoursquareAPITests.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 1/22/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import XCTest
@testable import SanCarlosMex

class FoursquareAPITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchVenuesSuccess() {
        let expectation = expectationWithDescription("Expecting the network call to suceed")
        let dataExpectation = expectationWithDescription("Expecting the network call to return data")

        
        FourSquareService.searchVenues("Restaurants") { (success, data) -> () in
            if success {
                expectation.fulfill()
            } else {
                XCTFail("Network call failed!")
            }
            if data != nil {
                dataExpectation.fulfill()
            } else {
                XCTFail("Data is nil")
            }
        }
        waitForExpectationsWithTimeout(3, handler: nil)
    }
    
    
    func testParseVenueResponseFail() {
        //Tests the parse function to fail
        let mockDataString = "Mock Data"
        if let mockData = (mockDataString as NSString).dataUsingEncoding(NSUTF8StringEncoding) {

                FourSquareService.parseVenueResponse(mockData) { (success, venues) -> () in
                    if success {
                        XCTAssertEqual(venues![0].name, "Restaurant San Andres Hermosillo", "venues are not parsing correctly")
                        XCTAssertTrue(success, "The test failed, success is true")
                    } else {
                        XCTAssertFalse(success, "Fail test succeeded sucess is false")
                    }
            }
            }
        }
    
    func testParseVenueResponse() {
        //Tests the parse function to success

        if let JSONfile = NSBundle.mainBundle().URLForResource("Foursquare", withExtension: "json") {
            
            do {
                let mockData = try NSData(contentsOfURL: JSONfile, options: NSDataReadingOptions.DataReadingUncached)
                
                FourSquareService.parseVenueResponse(mockData) { (success, venues) -> () in
                    if success {
                        if let venues = venues {
                        XCTAssertEqual(venues[0].name, "Restaurant San Andres Hermosillo", "venues are not parsing correctly")
                        XCTAssertTrue(success, "The test passed, success is true")
                        }
                    } else {
                        XCTAssertFalse(success, "Fail test sucess is false")
                    }
                }
            } catch {
                error
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}
