//
//  AnagramReverseWordsUITests.swift
//  AnagramReverseWordsUITests
//
//  Created by Dmitrii on 22.02.2022.
//

import XCTest

class AnagramReverseWordsUITests: XCTestCase {
    
    func testDefaultOutputIsCorrect() {
        //        Given
        let app = XCUIApplication()
        let outputText = app.textViews["outputText"]
        let inputText = app.textFields["inputText"]
        let resultButton = app.buttons["resultButton"]
        let testString = "Foxminded cool 24/7"
        //        When
        app.launch()
        inputText.tap()
        inputText.typeText(testString)
        outputText.tap()
        resultButton.tap()
        //        Then
        XCTAssertTrue(outputText.value as? String == "dednimxoF looc 24/7")
        app.terminate()
    }
    
    func testCustomtOutputIsCorrect() {
        //        Given
        let app = XCUIApplication()
        let outputText = app.textViews["outputText"]
        let inputText = app.textFields["inputText"]
        let resultButton = app.buttons["resultButton"]
        let customSelector = app.buttons["Custom"]
        let inputExclusionField = app.textFields["inputExclusionField"]
        let testString = "Foxminded cool 24/7"
        let exclusionString = "xl"
        //        When
        app.launch()
        inputText.tap()
        inputText.typeText(testString)
        customSelector.tap()
        inputExclusionField.tap()
        inputExclusionField.typeText(exclusionString)
        resultButton.tap()
        //        Then
        XCTAssertTrue(outputText.value as? String == "dexdnimoF oocl 7/42")
        app.terminate()
    }
}



