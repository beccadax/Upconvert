//
//  BinaryInteger.swift
//  Upconvert
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. All rights reserved.
//

extension Int8: Upconvertible {
    public typealias Upconverted = Int16
}

extension Int16: Upconvertible {
    public typealias Upconverted = Int32
}

extension Int32: Upconvertible {
    public typealias Upconverted = Int
}

extension Int: Upconvertible {
    public typealias Upconverted = Int64
}

//extension Int64: Upconvertible {
//    public typealias Upconverted = DoubleWidth<Int64>
//}

extension UInt8: Upconvertible {
    public typealias Upconverted = UInt16
}

extension UInt16: Upconvertible {
    public typealias Upconverted = UInt32
}

extension UInt32: Upconvertible {
    public typealias Upconverted = UInt
}

extension UInt: Upconvertible {
    public typealias Upconverted = UInt64
}

//extension UInt64: Upconvertible {
//    public typealias Upconverted = DoubleWidth<UInt64>
//}

//extension DoubleWidth: Upconvertible {
//    public typealias Upconverted = DoubleWidth<DoubleWidth>
//}

extension Upconvertible where Self: BinaryInteger, Upconverted: BinaryInteger {
    /// Converts the integer to a wider integer type.
    public var upconverted: Upconverted {
        print(Upconverted.self)
        return Upconverted(exactly: self)!
    }
}
