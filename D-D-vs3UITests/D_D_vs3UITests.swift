//
//  D_D_vs3UITests.swift
//  D-D-vs3UITests
//
//  Created by Osheen Walawedura on 16/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import XCTest

class D_D_vs3UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
    func testOperations() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
         //deleting a location
        let app = XCUIApplication()
        app.buttons["Delete"].tap()
        app.navigationBars["General Locations"].buttons["General Locations"].tap()
        
        //viewing and switching between characters
        app.tabBars.buttons["Characters"].tap()
        app.navigationBars["Characters"].buttons["Characters"].tap()
        app.tables.staticTexts["Gundren Rockseeker"].tap()
        
        //edit and confirm -> can't get it to work runs into error
        XCUIApplication().buttons["Edit"].tap() //-> timestamped event matching error failed to find matching element
        

    }

    
}
