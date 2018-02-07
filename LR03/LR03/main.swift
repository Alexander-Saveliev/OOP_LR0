//
//  main.swift
//  LR03
//
//  Created by Marty on 01/02/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

func readNumber() -> Int? {
    let number = Int(readLine() ?? "")
    
    guard number != nil && number! >= 0 else {
        print("Incorrect input")
        return nil
    }
    
    return number
}


//////////////////////////////////////////////////////////


let comma   = ", "
let empty   = ""
let newLine = ",\n"

var fib0 = 0
var fib1 = 1

print("Top: ", separator: empty, terminator: empty)

if let top = readNumber() {
    var comaDetector = 0
    var prefix: String!
    
    while fib1 <= top {
        if prefix == nil {
            prefix = empty
        } else {
            prefix = comaDetector == 0 ? newLine : comma
        }
        
        comaDetector += 1
        comaDetector %= 5
        
        print(prefix, fib1, separator: empty, terminator: empty)
        
        
        assert(Int.max - fib0 - fib1 >= 0, "Overflow")
        
        (fib0, fib1) = (fib1, fib0 + fib1)
    }
    
    print()
}





