//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Dmitrii on 13.02.2022.
//

import XCTest
import ReverseWords

class ReverseWordsUITests: XCTestCase {

    func testUI() {
        let app = XCUIApplication()
        app.launch()
        
        let textInput = app.textFields["textInput"]
        let textOutput = app.textViews["textOutput"]
        let reverseButton = app.buttons["reverseButton"]
        let testString = "Test string"
 
        func reverseButtonIsEnabled() {
        textInput.tap()
        textInput.typeText(testString)
        XCTAssertTrue(reverseButton.isEnabled)
        }

        func outputIsCorrect() {
            app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards",".buttons[\"fine\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.twoFingerTap()
            XCTAssertTrue(textOutput.value as? String == "tseT gnirts")
        }
      
        reverseButtonIsEnabled()
        outputIsCorrect()
    }
}
