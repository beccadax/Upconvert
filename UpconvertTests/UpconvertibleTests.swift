//
//  UpconvertibleTests.swift
//  UpconvertTests
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. Distributed under the MIT License.
//

import XCTest
import Upconvert

class UpconvertibleTests: XCTestCase {
    fileprivate let topOne = Top.one
    fileprivate let midOne = Mid.one
    fileprivate let botOne = Bot.one
    
    func testOneStep() {
        XCTAssertEqual(topOne, ^midOne)
        XCTAssertEqual(midOne, ^botOne)
    }
    
    func testTwoSteps() {
        XCTAssertEqual(topOne, ^botOne)
    }
}

fileprivate enum Top: Equatable {
    case one, two, three
}

fileprivate enum Mid: Equatable {
    case one, two
}

fileprivate enum Bot: Equatable {
    case one
}

extension Mid: Upconvertible {
    var upconverted: Top {
        switch self {
        case .one:
            return .one
        case .two:
            return .two
        }
    }
}

extension Bot: Upconvertible {
    var upconverted: Mid {
        switch self {
        case .one:
            return .one
        }
    }
}
