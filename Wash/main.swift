//
//  main.swift
//  wash
//
//  Created by Lee Walsh on 15/01/2016.
//  Copyright © 2016 Lee David Walsh. All rights reserved.
//

import Foundation

let arguments = NSProcessInfo.processInfo().arguments
if arguments.count < 2 || arguments[1] == "-h"{
    PSHelp.printHelp()
    exit(0)
} else {
    var keyPathArg = 1
    var flags = PSFlags("")
    let index = arguments[1].startIndex
    if arguments[1][index] == "-"{
        flags = PSFlags(arguments[1])
        print("Main: \(flags)")
        keyPathArg++
    }
    if arguments.count < keyPathArg+1{
        PSHelp.printHelp()
        exit(-3221)     //? exit code for invalid argument
    }
    let keyPath = arguments[keyPathArg]
    print("Main: \(keyPath)")
}
