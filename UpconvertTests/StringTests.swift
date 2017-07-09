//
//  StringTests.swift
//  UpconvertTests
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. Distributed under the MIT License.
//

import XCTest
import Upconvert

let string = "zyzyx"
let oneIndex = string.index(after: string.startIndex)
let oneScalarIndex = oneIndex.samePosition(in: string.unicodeScalars)
let twoIndex = string.index(after: oneIndex)
let fourIndex = string.index(before: string.endIndex)

class StringTests: XCTestCase {
    func testSubstring() {
        let substring = string[oneIndex ..< fourIndex]
        XCTAssertEqual(^substring, "yzy", "Substring converts to String")
    }
    
    func testOneStep() {
        XCTAssertEqual(^string.unicodeScalars[oneScalarIndex], string[oneIndex], "UnicodeScalar converts to Character")
        XCTAssertEqual(^string[oneIndex], String(string[oneIndex ..< twoIndex]), "Character converts to String")
    }
    
    func testTwoSteps() {
        XCTAssertEqual(^string.unicodeScalars[oneScalarIndex], String(string[oneIndex ..< twoIndex]), "UnicodeScalar converts to String")
    }
}
