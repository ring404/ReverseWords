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
        let properResult = "dednimxoF looc 24/7"
        //        When
        app.launch()
        inputText.tap()
        inputText.typeText(testString)
        outputText.tap()
        resultButton.tap()
        //        Then
        XCTAssertEqual(outputText.value as? String , properResult)
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
        let properResult = "dexdnimoF oocl 7/42"
        //        When
        app.launch()
        inputText.tap()
        inputText.typeText(testString)
        customSelector.tap()
        inputExclusionField.tap()
        inputExclusionField.typeText(exclusionString)
        resultButton.tap()
        //        Then
        XCTAssertEqual(outputText.value as? String, properResult)
        app.terminate()
    }
    
    func testOutputIsEmptyAfterTabChange() {
        //        Given
        let app = XCUIApplication()
        let outputText = app.textViews["outputText"]
        let inputText = app.textFields["inputText"]
        let customSelector = app.buttons["Custom"]
        let testString = "Foxminded cool 24/7"
        let properResult = ""
        //        When
        app.launch()
        inputText.tap()
        inputText.typeText(testString)
        customSelector.tap()
        //        Then
        XCTAssertEqual(outputText.value as? String, properResult)
        app.terminate()
    }
    
    func testCustomtOutputIsCorrectWithoutTappingTheButton() {
        //        Given
        let app = XCUIApplication()
        let outputText = app.textViews["outputText"]
        let inputText = app.textFields["inputText"]
        let customSelector = app.buttons["Custom"]
        let inputExclusionField = app.textFields["inputExclusionField"]
        let testString = "Foxminded cool 24/7"
        let exclusionString = "xl"
        let properResult = "dexdnimoF oocl 7/42"
        //        When
        app.launch()
        inputText.tap()
        inputText.typeText(testString)
        customSelector.tap()
        inputExclusionField.tap()
        inputExclusionField.typeText(exclusionString)
        //        Then
        XCTAssertEqual(outputText.value as? String, properResult)
        app.terminate()
    }
    
    func testCustomtOutputIsCorrectIfInputEqualsExclusion() {
        //        Given
        let app = XCUIApplication()
        let outputText = app.textViews["outputText"]
        let inputText = app.textFields["inputText"]
        let resultButton = app.buttons["resultButton"]
        let customSelector = app.buttons["Custom"]
        let inputExclusionField = app.textFields["inputExclusionField"]
        let testString = "Foxminded cool 24/7"
        let exclusionString = "Foxminded cool 24/7"
        let properResult = "Foxminded cool 24/7"
        //        When
        app.launch()
        inputText.tap()
        inputText.typeText(testString)
        customSelector.tap()
        inputExclusionField.tap()
        inputExclusionField.typeText(exclusionString)
        resultButton.tap()
        //        Then
        XCTAssertEqual(outputText.value as? String, properResult)
        app.terminate()
    }
    
    func testDefaultOutputAfterSwitchingToCustomAndAddingExclusion() {
        //        Given
        let app = XCUIApplication()
        let outputText = app.textViews["outputText"]
        let inputText = app.textFields["inputText"]
        let resultButton = app.buttons["resultButton"]
        let customSelector = app.buttons["Custom"]
        let defaultSelector = app.buttons["Default"]
        let inputExclusionField = app.textFields["inputExclusionField"]
        let testString = "Foxminded cool 24/7"
        let exclusionString = "lx"
        let properResult = "dednimxoF looc 24/7"
        //        When
        app.launch()
        inputText.tap()
        inputText.typeText(testString)
        customSelector.tap()
        inputExclusionField.tap()
        inputExclusionField.typeText(exclusionString)
        defaultSelector.tap()
        resultButton.tap()
        //        Then
        XCTAssertEqual(outputText.value as? String, properResult)
        app.terminate()
    }
}



