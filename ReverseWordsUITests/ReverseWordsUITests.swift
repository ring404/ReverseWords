//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Dmitrii on 13.02.2022.
//

import XCTest
import ReverseWords

class ReverseWordsUITests: XCTestCase {
    private func testUI() {
        let app = XCUIApplication()
        app.launch()
        reverseButtonIsEnabled()
        outputIsCorrect()
    }
    private func reverseButtonIsEnabled() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let reverseButton = app.buttons["reverseButton"]
        let testString = "Test string"
        //        When
        textInput.tap()
        textInput.typeText(testString)
        //        Then
        XCTAssertTrue(reverseButton.isEnabled)
    }
    
    private func outputIsCorrect() {
        //        Given
        let app = XCUIApplication()
        let textOutput = app.textViews["textOutput"]
        //        When
        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards",".buttons[\"fine\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.twoFingerTap()
        //        Then
        XCTAssertTrue(textOutput.value as? String == "tseT gnirts")
    }
}
