//
//  Upconvertible.swift
//  Upconvert
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. Distributed under the MIT License.
//

/// Conforming types can be unconditionally, losslessly converted to 
/// another type through the upconversion operator, `^`.
public protocol Upconvertible {
    /// The type which this type will become when upconverted.
    associatedtype Upconverted
    
    /// Returns `self`, losslessly converted to a "wider" type.
    /// 
    /// Do not use this property directly. Instead, use the upconversion 
    /// operator, `^`:
    /// 
    ///     let sum = ^int8 + int32
    var upconverted: Upconverted { get }
}
