//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Dmitrii on 13.02.2022.
//

import XCTest
@testable import ReverseWords

class ReverseWordsUnitTests: XCTestCase {
    
    // MARK: - Properties
    
   private let reverseManager = ReverseStringManager()
   private let testString = "Test string"
    
    
    // MARK: - Methods
    
    private func testStringReversing() {
        let result = reverseManager.reverseString(text: testString)
        XCTAssertTrue(result == "tseT gnirts")
    }
    
    private func testStringNotNil() {
        let result = reverseManager.reverseString(text: testString)
        XCTAssertNotNil(result == "tseT gnirts")
    }
}
