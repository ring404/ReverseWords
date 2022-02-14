//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Dmitrii on 13.02.2022.
//

import XCTest
@testable import ReverseWords

class ReverseWordsUnitTests: XCTestCase {
    
    func testStringReversing() {
        let reverseManager = ReverseStringManager()
        let testString = "Test string"
        let result = reverseManager.reverseString(text: testString)
        XCTAssertTrue(result == "tseT gnirts")
        XCTAssertNotNil(result == "tseT gnirts")
    }
}
