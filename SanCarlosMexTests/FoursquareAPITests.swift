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
        
        FourSquareService.searchVenues("Restaurants") { (success, data) -> () in
            if success {
                expectation.fulfill()
            } else {
                XCTFail("Network call failed!")
            }
        }
        waitForExpectationsWithTimeout(3, handler: nil)
    }
    
    func testParseVenueResponseFail() {
        let mockData: NSData?
        FourSquareService.parseVenueResponse(mockData) { (success, venues) -> () in
            <#code#>
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
