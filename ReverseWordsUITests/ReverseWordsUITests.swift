//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Dmitrii on 13.02.2022.
//

import XCTest
import ReverseWords

class ReverseWordsUITests: XCTestCase {
    func testreverseButtonIsEnabled() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let reverseButton = app.buttons["reverseButton"]
        let testString = "Test string"
        let properResult = true
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        //        Then
        XCTAssertEqual(reverseButton.isEnabled, properResult)
        app.terminate()
    }
    
    func testOutputIsCorrect() {
        //        Given
        let app = XCUIApplication()
        let textOutput = app.textViews["textOutput"]
        let textInput = app.textFields["textInput"]
        let reverseButton = app.buttons["reverseButton"]
        let testString = "Test string"
        let properResult = "tseT gnirts"
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertEqual(textOutput.value as? String , properResult)
        app.terminate()
    }
    
    func testButtonIsDisabledAfterAddingAndDeletingText() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        let properResult = true
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textInput.tap()
        textInput.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Cut"]/*[[".menus",".menuItems[\"Cut\"].staticTexts[\"Cut\"]",".staticTexts[\"Cut\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        textInput.tap()
        //        Then
        XCTAssertEqual(reverseButton.isEnabled, properResult)
        app.terminate()
    }
    
    func testInputIsEmptyAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        let properResult = "Text to reverse"
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        reverseButton.tap()
        //        Then
        XCTAssertEqual(textInput.value as? String, properResult)
        app.terminate()
    }
    
    func testOutputIsEmptyAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        let properResult = ""
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        reverseButton.tap()
        //        Then
        XCTAssertEqual(textOutput.value as? String, properResult)
        app.terminate()
    }
    
    func testButtonIsDisabledAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        let properResult = true
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        reverseButton.tap()
        //        Then
        XCTAssertEqual(reverseButton.isEnabled, properResult)
        app.terminate()
    }
    
    func testButtonLabelIsReverseAfterAddingAndDeletingText() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        let properResult = "Reverse"
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textInput.tap()
        textInput.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Cut"]/*[[".menus",".menuItems[\"Cut\"].staticTexts[\"Cut\"]",".staticTexts[\"Cut\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        textInput.tap()
        //        Then
        XCTAssertEqual(reverseButton.label, properResult)
        app.terminate()
    }
    
    func testButtonLabelIsReverseAfterAddingText() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        let properResult = "Reverse"
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textInput.tap()
        //        Then
        XCTAssertEqual(reverseButton.label, properResult)
        app.terminate()
    }
    
    func testButtonLabelIsClearAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        let properResult = "Clear"
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertEqual(reverseButton.label , properResult)
        app.terminate()
    }
    
    func testButtonIsEnabledAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        let properResult = true
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertEqual(reverseButton.isEnabled, properResult)
        app.terminate()
    }
    
    func testButtonLabelIsReverseAfterTextAddingThenReversingThenAddingMoreText() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        let properResult = "Reverse"
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        textInput.tap()
        textInput.typeText(testString)
        //        Then
        XCTAssertEqual(reverseButton.label, properResult)
        app.terminate()
    }
    
    func testButtonLabelIsClearAfterTextAddingThenReversingThenAddingMoreTextAndTapOnButton() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        let properResult = "Clear"
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertEqual(reverseButton.label, properResult)
        app.terminate()
    }
    
    func testTextoutputHasResultAfterTextAddingThenReversingThenAddingMoreTextAndTapOnButton() {
        //        Given
        let app = XCUIApplication()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        let properResult = "tseT tseTgnirts gnirts"
        //        When
        app.launch()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertEqual(textOutput.value as? String, properResult)
        app.terminate()
    }
}
