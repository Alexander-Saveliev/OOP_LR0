//
//  main.swift
//  LR04
//
//  Created by Marty on 01/02/2018.
//  Copyright © 2018 Marty. All rights reserved.
//


import Foundation


enum Instruction {
    case plus
    case minus
    case times
    case divide
}


func getInstruction(str: String) -> Instruction {
    switch str {
    case "+":
        return .plus
    case "-":
        return .minus
    case "*":
        return .times
    case "/":
        return .divide
    default:
        assertionFailure("Incorrect instruction: \"\(str)\"")
        return .plus
    }
}


func calculate(result: Double, instruction: Instruction, operand: Double) -> Double {
    assert(instruction != .divide || operand != 0.0, "Division by zero")
    
    switch instruction {
    case .plus:
        return result + operand
    case .minus:
        return result - operand
    case .times:
        return result * operand
    case .divide:
        return result / operand
    }
}


///////////////////////////


// Number of arguments
let argc = CommandLine.arguments.count - 1
assert(argc > 0, "I can't see any arguments")

// Arguments
let argy = CommandLine.arguments[1...argc]
assert(argc % 2 == 1, "Incorrect number of arguments. There must be an odd number of arguments")

var currentInstruction = Instruction.plus
var result             = 0.0

for (i, arg) in argy.enumerated() {
    if i % 2 == 0 {
        // Number
        if let operand = Double(arg) {
            result = calculate(result: result, instruction: currentInstruction, operand: operand)
        } else {
            assertionFailure("Argument \(i) \"\(arg)\" is not an operator")
        }
    } else {
        // Operation
        currentInstruction = getInstruction(str: arg)
    }
    
    print(arg, terminator: " ")
}

print("=", String(format:"%.3f", result))



