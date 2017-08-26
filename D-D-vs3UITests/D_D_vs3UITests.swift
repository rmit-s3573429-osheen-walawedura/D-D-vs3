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
    
   
    func testDeleteLocation() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()

        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        
        let textField = element.children(matching: .textField).element
        let textvalue = textField.value as! String
        XCTAssertEqual(textvalue, "Phandalin")
        
        let textView = element.children(matching: .textView).element
        let textViewValueBeforeDelete = textView.value as! String
        XCTAssertEqual(textViewValueBeforeDelete, "The town consisted of forty or fifty simple log buildings, some build on old fieldstone foundations. More old ruins - crumbling stone walls covered in ivy and briars - surround the newer buildings.")
        
        XCTAssertTrue(app.images["asset_phandalin"].exists)
        
        app.buttons["Delete"].tap()
        let valueAfterDelete = textField.value as! String
        XCTAssertEqual(valueAfterDelete, "Stormy Mountains")
        let textViewValueAfterDelete = textView.value as! String
        XCTAssertEqual(textViewValueAfterDelete, "A low mist settled over rock mountains and shimmered in the predawn light.")
        XCTAssertTrue(app.images["asset_hill"].exists)

    }
    
    func testDeleteCharacter() {
        let app = XCUIApplication()
        app.tabBars.buttons["Characters"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        
        let characterPage = element.children(matching: .other).element
        let name = characterPage.children(matching: .textField).element(boundBy: 0)
        let location = characterPage.children(matching: .textField).element(boundBy: 1)
        let description = characterPage.children(matching: .textView).element(boundBy: 0)
        let notes = characterPage.children(matching: .textView).element(boundBy: 1)

        XCTAssertEqual(name.value as! String, "Aram Silverheart")
        XCTAssertEqual(location.value as! String, "Aram's Traders")
        XCTAssertEqual(description.value as! String, "An old human, bent and bowed. He carries a walking stick in his left hand, but something suggests he might use it for more than walking")
        XCTAssertEqual(notes.value as! String,"Gruff voice. Likes carpentry.")
        XCTAssertTrue(app.images["human_male"].exists)
        
        app.buttons["Delete"].tap()

        XCTAssertEqual(name.value as! String, "Gundren Rockseeker")
        XCTAssertEqual(location.value as! String, "The Sleeping Giant")
        XCTAssertEqual(description.value as! String, "An dwarf in the prime of his life.")
        XCTAssertEqual(notes.value as! String,"Gruff voice. Likes carpentry.")
        XCTAssertTrue(app.images["asset_dwarf_male"].exists)    }

    func testSearchLocations()
    {
        let app = XCUIApplication()
        let generalLocationsButton = app.navigationBars["General Locations"].buttons["General Locations"]
        generalLocationsButton.tap()
        
        //how many elements currently in list
        let numberOfCells = app.tables.cells.count
        XCTAssertEqual(numberOfCells, 3)
        
        app.tables.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("dry")
        let afterSearchCells = app.tables.cells.count
        XCTAssertEqual(afterSearchCells, 1)

        
        app.tables.staticTexts["Dry River"].tap()
        
        let textField = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.value as! String
        XCTAssertEqual(textField, "Dry River")

        
    }
    
    func testSearchCharacters() {
        let app = XCUIApplication()
        
        app.tabBars.buttons["Characters"].tap()
        
        let charactersListButton = app.navigationBars["Characters"].buttons["Characters"]
        charactersListButton.tap()
        
        //how many elements currently in list
        let numberOfCells = app.tables.cells.count
        XCTAssertEqual(numberOfCells, 2)
        
        app.tables.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("Gun")
        let afterSearchCells = app.tables.cells.count
        XCTAssertEqual(afterSearchCells, 1)
        
        
        app.tables.staticTexts["Gundren Rockseeker"].tap()
        
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        
        let characterPage = element.children(matching: .other).element
        let name = characterPage.children(matching: .textField).element(boundBy: 0)
        let nameValue = name.value as! String
        
        XCTAssertEqual(nameValue, "Gundren Rockseeker")

    }
}
