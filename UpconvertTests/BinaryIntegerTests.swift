//
//  BinaryIntegerTests.swift
//  UpconvertTests
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. Distributed under the MIT License.
//

import XCTest
import Upconvert

class BinaryIntegerTests: XCTestCase {
    let i8: Int8 = 8
    let i16: Int16 = 16
    let i32: Int32 = 32
    let i: Int = -1
    let i64: Int64 = 64
//    let idw: DoubleWidth<Int64> = 128
    
    let u8: UInt8 = 8
    let u16: UInt16 = 16
    let u32: UInt32 = 32
    let u: UInt = 1
    let u64: UInt64 = 64
//    let udw: DoubleWidth<UInt64> = 128
    
    func assertConvertible<Original: BinaryInteger, Converted: BinaryInteger>(_ original: Original, _ converted: Converted, as convertedType: Converted.Type) {
        XCTAssert(original == converted, "Value is correct")
        XCTAssert(type(of: converted) == convertedType, "Type is correct")
    }
    
    func testOneStep() {
        assertConvertible(i8, ^i8, as: Int16.self)
        assertConvertible(i16, ^i16, as: Int32.self)
        assertConvertible(i32, ^i32, as: Int.self)
        assertConvertible(i, ^i, as: Int64.self)
//        assertConvertible(i64, ^i64, as: DoubleWidth<Int64>.self)
        
        assertConvertible(u8, ^u8, as: UInt16.self)
        assertConvertible(u16, ^u16, as: UInt32.self)
        assertConvertible(u32, ^u32, as: UInt.self)
        assertConvertible(u, ^u, as: UInt64.self)
//        assertConvertible(u64, ^u64, as: DoubleWidth<UInt64>.self)
    }
    
    func testTwoSteps() {
        assertConvertible(i8, ^i8, as: Int32.self)
        assertConvertible(i16, ^i16, as: Int.self)
        assertConvertible(i32, ^i32, as: Int64.self)
//        assertConvertible(i, ^i, as: DoubleWidth<Int64>.self)
        
        assertConvertible(u8, ^u8, as: UInt32.self)
        assertConvertible(u16, ^u16, as: UInt.self)
        assertConvertible(u32, ^u32, as: UInt64.self)
//        assertConvertible(u, ^u, as: DoubleWidth<UInt64>.self)
    }
    
    func testThreeSteps() {
        assertConvertible(i8, ^i8, as: Int.self)
        assertConvertible(i16, ^i16, as: Int64.self)
//        assertConvertible(i32, ^i32, as: DoubleWidth<Int64>.self)
        
        assertConvertible(u8, ^u8, as: UInt.self)
        assertConvertible(u16, ^u16, as: UInt64.self)
//        assertConvertible(u32, ^u32, as: DoubleWidth<UInt64>.self)
    }
    
    func testFourSteps() {
        assertConvertible(i8, ^i8, as: Int64.self)
//        assertConvertible(i16, ^i16, as: DoubleWidth<Int64>.self)
        
        assertConvertible(u8, ^u8, as: UInt64.self)
//        assertConvertible(u16, ^u16, as: DoubleWidth<UInt64>.self)
    }
    
    func testFiveSteps() {
//        assertConvertible(i8, ^i8, as: DoubleWidth<Int64>.self)
        
//        assertConvertible(u8, ^u8, as: DoubleWidth<UInt64>.self)
    }
}
