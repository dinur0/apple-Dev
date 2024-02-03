//
//  MyUITests.swift
//  MyUITests
//
//  Created by хех on 03.02.2024.
//

import XCTest

final class MyUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testTabClick(){
        
        let app = XCUIApplication()
        let webViewsQuery = app.webViews.webViews.webViews
        webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter phone number"]/*[[".otherElements[\"VK ID\"].textFields[\"Enter phone number\"]",".textFields[\"Enter phone number\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        webViewsQuery/*@START_MENU_TOKEN@*/.buttons["Continue"]/*[[".otherElements[\"VK ID\"].buttons[\"Continue\"]",".buttons[\"Continue\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Code"]/*[[".otherElements[\"VK ID\"].textFields[\"Code\"]",".textFields[\"Code\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Мурат Айбазов"]/*[[".cells.staticTexts[\"Мурат Айбазов\"]",".staticTexts[\"Мурат Айбазов\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["PROFILE!!!!!!!!"].buttons["Friends"].tap()
        app.navigationBars["Friends"].buttons["edit"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
                                
    }
}
