//
//  BinaryFloatingPointTests.swift
//  UpconvertTests
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. All rights reserved.
//

import XCTest
import Upconvert

class BinaryFloatingPointTests: XCTestCase {
    let float: Float = 1.0
    let cgFloat: CGFloat = 1.5
    let double: Double = 2
    let float80: Float80 = 2.5
    
    func assertConvertible<Original: BinaryFloatingPoint, Converted: BinaryFloatingPoint>(_ original: Original, _ converted: Converted, as convertedType: Converted.Type) {
        XCTAssert(String(describing: original) == String(describing: converted), "Value is correct")
        XCTAssert(type(of: converted) == convertedType, "Type is correct")
    }

    func testOneStep() {
        assertConvertible(float, ^float, as: CGFloat.self)
        assertConvertible(cgFloat, ^cgFloat, as: Double.self)
        assertConvertible(double, ^double, as: Float80.self)
    }

    func testTwoSteps() {
        assertConvertible(float, ^float, as: Double.self)
        assertConvertible(cgFloat, ^cgFloat, as: Float80.self)
    }

    func testThreeSteps() {
        assertConvertible(float, ^float, as: Float80.self)
    }
}
