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
        app.launch()
        let textInput = app.textFields["textInput"]
        let reverseButton = app.buttons["reverseButton"]
        let testString = "Test string"
        //        When
        textInput.tap()
        textInput.typeText(testString)
        //        Then
        XCTAssertTrue(reverseButton.isEnabled)
        app.terminate()
    }
    
    func testOutputIsCorrect() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textOutput = app.textViews["textOutput"]
        let textInput = app.textFields["textInput"]
        let reverseButton = app.buttons["reverseButton"]
        let testString = "Test string"
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertTrue(textOutput.value as? String == "tseT gnirts")
        app.terminate()
    }
    
    func testButtonIsDisabledAfterAddingAndDeletingText() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textInput.tap()
        textInput.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Cut"]/*[[".menus",".menuItems[\"Cut\"].staticTexts[\"Cut\"]",".staticTexts[\"Cut\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        textInput.tap()
        //        Then
        XCTAssertFalse(reverseButton.isEnabled)
        app.terminate()
    }
    
    func testInputIsEmptyAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        reverseButton.tap()
        //        Then
        XCTAssertTrue(textInput.value as? String == "Text to reverse")
        app.terminate()
    }
    
    func testOutputIsEmptyAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        reverseButton.tap()
        //        Then
        XCTAssertTrue(textOutput.value as? String == "")
        app.terminate()
    }
    
    func testButtonIsDisabledAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        reverseButton.tap()
        //        Then
        XCTAssertFalse(reverseButton.isEnabled)
        app.terminate()
    }
    
    func testButtonLabelIsReverseAfterAddingAndDeletingText() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textInput.tap()
        textInput.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Cut"]/*[[".menus",".menuItems[\"Cut\"].staticTexts[\"Cut\"]",".staticTexts[\"Cut\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        textInput.tap()
        //        Then
        XCTAssertTrue(reverseButton.label == "Reverse")
        app.terminate()
    }
    
    func testButtonLabelIsReverseAfterAddingText() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textInput.tap()
        //        Then
        XCTAssertTrue(reverseButton.label == "Reverse")
        app.terminate()
    }
    
    func testButtonLabelIsClearAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertTrue(reverseButton.label == "Clear")
        app.terminate()
    }
    
    func testButtonIsEnabledAfterTextAddingAndReversing() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertTrue(reverseButton.isEnabled)
        app.terminate()
    }
    
    func testButtonLabelIsReverseAfterTextAddingThenReversingThenAddingMoreText() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        textInput.tap()
        textInput.typeText(testString)
        //        Then
        XCTAssertTrue(reverseButton.label == "Reverse")
        app.terminate()
    }
    
    func testButtonLabelIsClearAfterTextAddingThenReversingThenAddingMoreTextAndTapOnButton() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertTrue(reverseButton.label == "Clear")
        app.terminate()
    }
    
    func testTextoutputHasResultAfterTextAddingThenReversingThenAddingMoreTextAndTapOnButton() {
        //        Given
        let app = XCUIApplication()
        app.launch()
        let textInput = app.textFields["textInput"]
        let testString = "Test string"
        let reverseButton = app.buttons["reverseButton"]
        let textOutput = app.textViews["textOutput"]
        //        When
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        textInput.tap()
        textInput.typeText(testString)
        textOutput.tap()
        reverseButton.tap()
        //        Then
        XCTAssertTrue(textOutput.value as? String == "tseT tseTgnirts gnirts")
        app.terminate()
    }
}
