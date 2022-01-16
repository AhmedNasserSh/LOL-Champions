//
//  LOLChampionsUITests.swift
//  LOLChampionsUITests
//
//  Created by Ahmed Naser on 08/01/2022.
//

import XCTest

class LOLChampionsUITests: APPUITestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testFetchData() throws {
        let app = XCUIApplication()
        app.launch()
        
        let elementsQuery = XCUIApplication().scrollViews.otherElements

        waitForElementToAppear(element: elementsQuery.staticTexts["Aatrox"], timeout: .init(5))
        elementsQuery.buttons["Aatrox"].tap()

        waitForElementToAppear(element: elementsQuery.staticTexts["Aatrox"], timeout: .init(5))
    }
    
    func testFetchSpells() {
        let app = XCUIApplication()
        app.launch()
        
        let elementsQuery = XCUIApplication().scrollViews.otherElements

        waitForElementToAppear(element: elementsQuery.staticTexts["Aatrox"], timeout: .init(5))
        elementsQuery.buttons["Aatrox"].tap()
        
        let spellElment = elementsQuery.scrollViews
            .containing(.other, identifier: "Vertical scroll bar, 1 page")
            .children(matching: .other).element(boundBy: 0).children(matching: .other).element
            .children(matching: .image).element(boundBy: 0)
        
        waitForElementToAppear(element: spellElment, timeout: .init(5))

    }

}
