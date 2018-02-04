//
//  main.swift
//  LR05
//
//  Created by Marty on 04/02/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

func getDistanceByAngle(_ a0: Double, andSpeed v0: Double) -> Double {
    //    (v0)^2 * sin(2*a)
    //L = -----------------
    //            g
    
    let g = 9.8
    
    
    return pow(v0, 2) * sin(a0 * .pi / 180.0) / g
}


///////////////////////////


var isItSpeed = true

var acceleration = 0.0
var speed        = 0.0


while (true) {
    print("Enter", isItSpeed ? "v0" : "a0", "(or type ‘exit’)>", terminator: "")
    
    guard let userInput = readLine() else {
        assertionFailure("Something was wrong with reading")
        break
    }
    
    guard userInput != "exit" else {
        print("Goodbye")
        break
    }
    
    guard let value = Double(userInput) else {
        assertionFailure("Incorrect input")
        break
    }
    
    if isItSpeed {
        speed = value
    } else {
        acceleration = value
        let out = String(format: "%.03f", getDistanceByAngle(acceleration, andSpeed: speed))
        print("Distance is: ", out)
    }
    
    isItSpeed = !isItSpeed
}


