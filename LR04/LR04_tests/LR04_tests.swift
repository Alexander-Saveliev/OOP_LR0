//
//  LR04_tests.swift
//  LR04_tests
//
//  Created by Marty on 03/02/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest


func runAppWithargv(_ argv: [String]) -> String {
    let programName = "LR04"
    // Create a Task instance
    let task = Process()
    
    // Set the task parameters
    task.launchPath = "/usr/bin/env"
    task.arguments = ["./" + programName] + argv
    
    // Create a Pipe and make the task
    // put all the output there
    let pipe = Pipe()
    task.standardOutput = pipe
    
    // Launch the task
    task.launch()
    
    // Get the data
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue)

    return output != nil ? output! as String : ""
}


class LR04_tests: XCTestCase {
    
    func test0() {
        let argv   = ["10"]
        let test   = runAppWithargv(argv)
        let answer = "10 = 10.000\n"
        
        XCTAssertEqual(test, answer)
    }
    
    func test1() {
        let argv   = ["10", "+", "20"]
        let test   = runAppWithargv(argv)
        let answer = "10 + 20 = 30.000\n"
        
        XCTAssertEqual(test, answer)
    }
    
    func test2() {
        let argv   = ["10", "+", "10", "/", "3"]
        let test   = runAppWithargv(argv)
        let answer = "10 + 10 / 3 = 6.667\n"
        
        XCTAssertEqual(test, answer)
    }
    
    func test3() {
        let argv   = ["10", "/", "0"]
        let test   = runAppWithargv(argv)
        let answer = "10 / "
        
        XCTAssertEqual(test, answer)
    }
    
    func test4() {
        let argv   = ["1", "/", "3", "*", "3"]
        let test   = runAppWithargv(argv)
        let answer = "1 / 3 * 3 = 1.000\n"
        
        XCTAssertEqual(test, answer)
    }
    
    func test5() {
        let argv   = ["1", "/", "3", "*", "3", "+", "2", "-", "-6"]
        let test   = runAppWithargv(argv)
        let answer = "1 / 3 * 3 + 2 - -6 = 9.000\n"
        
        XCTAssertEqual(test, answer)
    }
    
    func test6() {
        let argv   = ["1.001", "/", "3.056", "*", "3.234", "+", "2.9", "-", "-6.009"]
        let test   = runAppWithargv(argv)
        let answer = "1.001 / 3.056 * 3.234 + 2.9 - -6.009 = 9.968\n"
        
        XCTAssertEqual(test, answer)
    }
    
    func testNotBigNumber() {
        let argv   = ["2700100500.001"]
        let test   = runAppWithargv(argv)
        let answer = "2700100500.001 = 2700100500.001\n"
        
        XCTAssertEqual(test, answer)
    }
    
    func nottestMaxInt() {
        let argv   = ["9223372036854775807"]
        let test   = runAppWithargv(argv)
        let answer = "9223372036854775807 = 9223372036854775807.000\n"
        
        XCTAssertEqual(test, answer)
    }
    
    func testNotNumber() {
        let argv   = ["10a"]
        let test   = runAppWithargv(argv)
        let answer = ""
        
        XCTAssertEqual(test, answer)
    }
    
    func testEmpty() {
        let argv   = [String]()
        let test   = runAppWithargv(argv)
        let answer = ""
        
        XCTAssertEqual(test, answer)
    }
    
}
