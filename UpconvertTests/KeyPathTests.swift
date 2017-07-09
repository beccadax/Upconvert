//
//  KeyPathTests.swift
//  UpconvertTests
//
//  Created by Brent Royal-Gordon on 7/8/17.
//  Copyright © 2017 Architechies. All rights reserved.
//

import XCTest
import Upconvert

class Person: Equatable {
    init(name: String) {
        self.name = name
    }
    
    var name: String
    var friends: [Person] = []
    var isFriendless: Bool {
        return friends.isEmpty
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.friends == rhs.friends
    }
}

class KeyPathTests: XCTestCase {
    let people: [Person] = {
        let p = [
            Person(name: "Alice"),
            Person(name: "Bob"),
            Person(name: "Eve")
        ]
        p[0].friends = [p[1]]
        p[1].friends = [p[0]]
        return p
    }()
    
    func testSpecific() {
        let fn = ^\Person.name
        XCTAssertEqual(fn(people[0]), "Alice", "Key path converted to function looks up the key path")
    }
    
    func testInferred() {
        // This test passes merely by compiling.
        let _: (Person) -> String = ^\.name
        let _: (Person) -> [Person] = ^\.friends
        let _: (Person) -> Bool = (^\.isFriendless)
    }
    
    func testUsage() {
        let names = people.map(^\.name)
        XCTAssertEqual(names, ["Alice", "Bob", "Eve"], "Key path conversion works in map")
        
        let bestFriends = people.flatMap(^\.friends.first)
        XCTAssertEqual(bestFriends, [people[1], people[0]], "Key path conversion works in flatMap")
        
        let friendless = people.filter(^\.isFriendless)
        XCTAssertEqual(friendless, [people[2]], "Key path conversion works in filter")
    }
}
