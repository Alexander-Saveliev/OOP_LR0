//
//  main.swift
//  LR03
//
//  Created by Marty on 01/02/2018.
//  Copyright © 2018 Marty. All rights reserved.
//


func getArgy() -> [String] {
    assert(CommandLine.arguments.count == 2, "Incorrect number of arguments. It must be 1")
    
    let argy = CommandLine.arguments
    
    return argy
}

//////////////////////////////////////////////////////////


let comma   = ", "
let empty   = ""
let newLine = ",\n"

var fib0 = 0
var fib1 = 1

let input = Int(getArgy()[1])

assert(input != nil, "Incorrect input")

if let top = input {
    var wordsInString = 0
    var prefix: String!
    
    while fib1 <= top {
        if prefix == nil {
            prefix = empty
        } else {
            prefix = wordsInString == 0 ? newLine : comma
        }
        
        wordsInString += 1
        wordsInString %= 5
        
        print(prefix, fib1, separator: empty, terminator: empty)
        
        
        assert(Int.max - fib0 - fib1 >= 0, "Overflow")
        
        (fib0, fib1) = (fib1, fib0 + fib1)
    }
    
    print()
}





