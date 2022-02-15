//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Dmitrii on 13.02.2022.
//

import XCTest
@testable import ReverseWords

class ReverseWordsUnitTests: XCTestCase {
    private func testStringReversing() {
        //        Given
        let testString = "Test string"
        let reverseManager = ReverseStringManager()
        //        When
        let result = reverseManager.reverseString(text: testString)
        //        Then
        XCTAssertTrue(result == "tseT gnirts")
    }
    
    private func testStringNotNil() {
        //        Given
        let testString = "Test string"
        let reverseManager = ReverseStringManager()
        //        When
        let result = reverseManager.reverseString(text: testString)
        //        Then
        XCTAssertNotNil(result)
    }
}
