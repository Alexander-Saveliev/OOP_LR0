//
//  main.swift
//  LR01
//
//  Created by Marty on 31/01/2018.
//  Copyright © 2018 Marty. All rights reserved.
//


let comma   = ", "
let newLine = "\n"

for i in 1...10 {
    let delimiter = (i == 10) ? newLine : comma
    
    print(i, terminator: delimiter)
}

print()

for i in stride(from: 100, to: 0, by: -1) where i % 2 == 0 {
    let delimiter = (i == 2) ? newLine : comma
    
    print(i, terminator: delimiter)
}


