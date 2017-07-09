//
//  String.swift
//  Upconvert
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. All rights reserved.
//

extension Substring: Upconvertible {
    public var upconverted: String {
        return String(self)
    }
}

extension Character: Upconvertible {
    public var upconverted: String {
        return String(self)
    }
}

extension Unicode.Scalar: Upconvertible {
    public var upconverted: Character {
        return Character(self)
    }
}
