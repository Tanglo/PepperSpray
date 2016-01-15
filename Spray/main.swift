//
//  main.swift
//  PepperSpray
//
//  Created by Lee Walsh on 15/01/2016.
//  Copyright © 2016 Lee David Walsh. All rights reserved.
//

import Foundation

let arguments = NSProcessInfo.processInfo().arguments
//print("\(arguments.count) arguments: \(arguments)")
if arguments.count < 2 || arguments[1] == "-h"{
    PSHelp.printHelp()
    exit(0)
} else {
    var keyPathArg = 1
    let index = arguments[1].startIndex
    if arguments[1][index] == "-"{
        
        let flags = PSFlags(arguments[1])
        print("Main: \(flags)")
        keyPathArg++
    }
    if arguments.count < keyPathArg+1{
        PSHelp.printHelp()
        exit(1)
    }
    let keyPath = arguments[keyPathArg]
    print("Main: \(keyPath)")
}




