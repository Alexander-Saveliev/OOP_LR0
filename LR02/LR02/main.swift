//
//  main.swift
//  LR02
//
//  Created by Marty on 31/01/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

func sumOfDigitsOf(_ number: Int) -> Int {
    var bufNumber = number
    var sum       = 0
    
    while bufNumber != 0 {
        sum += bufNumber % 10
        bufNumber /= 10
    }
    
    return sum
}


func readNumber() -> Int? {
    let number = Int(readLine() ?? "")
    
    guard number != nil && number! > 0 else {
        print("Incorrect input")
        return nil
    }
    
    return number
}


//////////////////////////////////////////////////////////


if let top = readNumber() {
    for i in 1...top where i % sumOfDigitsOf(i) == 0 {
        print(i)
    }
}


