//
//  AnagramReverseWordsTests.swift
//  AnagramReverseWordsTests
//
//  Created by Dmitrii on 22.02.2022.
//

import XCTest
@testable import AnagramReverseWords

class AnagramReverseWordsTests: XCTestCase {
    
    func testDefaultAnagramStringReversingCaseOne() {
        //        Given
        let testString = "Foxminded cool 24/7"
        let properResult = "dednimxoF looc 24/7"
        let reverseManager = ReverseStringManager()
        //        When
        let result = reverseManager.reverseStringDefaultState(text: testString)
        //        Then
        XCTAssertEqual(result, properResult)
    }
    
    func testDefaultAnagramStringReversingCaseTwo() {
        //        Given
        let testString = "abcd efgh"
        let properResult = "dcba hgfe"
        let reverseManager = ReverseStringManager()
        //        When
        let result = reverseManager.reverseStringDefaultState(text: testString)
        //        Then
        XCTAssertEqual(result, properResult)
    }
    
    func testDefaultAnagramStringReversingCaseThree() {
        //        Given
        let testString = "a1bcd efg!h"
        let properResult = "d1cba hgf!e"
        let reverseManager = ReverseStringManager()
        //        When
        let result = reverseManager.reverseStringDefaultState(text: testString)
        //        Then
        XCTAssertEqual(result, properResult)
    }
    
    func testCustomAnagramStringReversingCaseOne() {
        //        Given
        let testString = "Foxminded cool 24/7"
        let properResult = "dexdnimoF oocl 7/42"
        let exclusion = "xl"
        let reverseManager = ReverseStringManager()
        //        When
        let result = reverseManager.reverseStringWithExclusion(text: testString, exclusion: exclusion)
        //        Then
        XCTAssertEqual(result, properResult)
    }
    
    func testCustomAnagramStringReversingCaseTwo() {
        //        Given
        let testString = "abcd efgh"
        let properResult = "dcba hgfe"
        let exclusion = "xl"
        let reverseManager = ReverseStringManager()
        //        When
        let result = reverseManager.reverseStringWithExclusion(text: testString, exclusion: exclusion)
        //        Then
        XCTAssertEqual(result, properResult)
    }
    
    func testCustomAnagramStringReversingCaseThree() {
        //        Given
        let testString = "a1bcd efglh"
        let properResult = "dcb1a hgfle"
        let exclusion = "xl"
        let reverseManager = ReverseStringManager()
        //        When
        let result = reverseManager.reverseStringWithExclusion(text: testString, exclusion: exclusion)
        //        Then
        XCTAssertEqual(result, properResult)
    }
    
}
