//
//  LR05_tests.swift
//  LR05_tests
//
//  Created by Marty on 04/02/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest


func getDistanceByAngle(_ a: Double, andSpeed v0: Double) -> Double {
    //    (v0)^2 * sin(2*a)
    //L = -----------------
    //            g
    
    let g = 9.8
    
    return pow(v0, 2) * sin(2 * a * .pi / 180.0) / g
}


class LR05_tests: XCTestCase {
    
    func test0() {
        XCTAssertEqual(getDistanceByAngle(0, andSpeed: 1), 0.0)
        XCTAssertEqual(getDistanceByAngle(1, andSpeed: 0), 0.0)
        XCTAssertEqual(getDistanceByAngle(0, andSpeed: 0), 0.0)
        XCTAssertEqual(getDistanceByAngle(361, andSpeed: 0), 0.0)
    }
    
    func test1() {
        XCTAssertEqual(getDistanceByAngle(0.5, andSpeed: 1), 0.002, accuracy: 0.0005)
        XCTAssertEqual(getDistanceByAngle(15, andSpeed: 15), 11.480, accuracy: 0.0005)
        XCTAssertEqual(getDistanceByAngle(30, andSpeed: 127), 1425.319, accuracy: 0.0005)
    }
    
}
