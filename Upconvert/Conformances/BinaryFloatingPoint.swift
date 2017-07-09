//
//  BinaryFloatingPoint.swift
//  Upconvert
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. All rights reserved.
//

import CoreGraphics

extension Float: Upconvertible {
    public typealias Upconverted = CGFloat
    
    public var upconverted: Upconverted {
        return Upconverted(self)
    }
}

extension CGFloat: Upconvertible {
    public typealias Upconverted = Double
    
    public var upconverted: Upconverted {
        return Upconverted(self)
    }
}

extension Double: Upconvertible {
    public typealias Upconverted = Float80
    
    public var upconverted: Upconverted {
        return Upconverted(self)
    }
}

// Not yet supported
//extension Upconvertible where Self: BinaryFloatingPoint, Upconverted: BinaryFloatingPoint {
//    public var upconverted: Upconverted {
//        return Upconverted(self)
//    }
//}

