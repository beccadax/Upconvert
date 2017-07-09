//
//  KeyPath.swift
//  Upconvert
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. All rights reserved.
//

extension KeyPath: Upconvertible {
    public typealias Upconverted = (Root) -> Value
    
    /// Converts the KeyPath to a getter function.
    public var upconverted: (Root) -> Value {
        return { $0[keyPath: self] }
    }
}

// HACK: This overload encourages swiftc to choose `KeyPath`, rather  
// than one of the `WritableKeyPath` types, when it tries to infer the  
// type of a `^\.foo` expression, preventing an ambiguity.

/// The upconversion operator converts its operand to a "broader" type, 
/// such as a wider integer type. Upconversion never fails and always 
/// preserves the original value.
public prefix func ^<Root, Value>(operand: KeyPath<Root, Value>) -> (Root) -> Value {
    return operand.upconverted
}
