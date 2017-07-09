//
//  Operators.swift
//  Upconvert
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. All rights reserved.
//

prefix operator ^

/// The upconversion operator converts its operand to a "broader" type, 
/// such as a wider integer type. Upconversion never fails and always 
/// preserves the original value.
extension Upconvertible {
    public static prefix func ^(operand: Self) -> Upconverted {
        return operand.upconverted
    }
}

// Operators below this point simply let you upconvert through several  
// types at once. Five is an arbitrary choice; it just happens to be  
// enough to get you from the smallest integers to the largest.

extension Upconvertible where 
    Upconverted: Upconvertible
{
    /// The upconversion operator converts its operand to a "broader" type, 
    /// such as a wider integer type. Upconversion never fails and always 
    /// preserves the original value.
    public static prefix func ^(operand: Self) ->
        Upconverted.Upconverted
    {
        return ^(^operand)
    }
}

extension Upconvertible where 
    Upconverted: Upconvertible,
    Upconverted.Upconverted: Upconvertible
{
    /// The upconversion operator converts its operand to a "broader" type, 
    /// such as a wider integer type. Upconversion never fails and always 
    /// preserves the original value.
    public static prefix func ^(operand: Self) ->
        Upconverted.Upconverted.Upconverted
    {
        return ^(^(^operand))
    }
}

extension Upconvertible where 
    Upconverted: Upconvertible,
    Upconverted.Upconverted: Upconvertible,
    Upconverted.Upconverted.Upconverted: Upconvertible
{
    /// The upconversion operator converts its operand to a "broader" type, 
    /// such as a wider integer type. Upconversion never fails and always 
    /// preserves the original value.
    public static prefix func ^(operand: Self) ->
        Upconverted.Upconverted.Upconverted.Upconverted
    {
        return ^(^(^(^operand)))
    }
}

extension Upconvertible where 
    Upconverted: Upconvertible,
    Upconverted.Upconverted: Upconvertible,
    Upconverted.Upconverted.Upconverted: Upconvertible,
    Upconverted.Upconverted.Upconverted.Upconverted: Upconvertible
{
    /// The upconversion operator converts its operand to a "broader" type, 
    /// such as a wider integer type. Upconversion never fails and always 
    /// preserves the original value.
    public static prefix func ^(operand: Self) ->
        Upconverted.Upconverted.Upconverted.Upconverted.Upconverted
    {
        return ^(^(^(^(^operand))))
    }
}
