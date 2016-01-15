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
}



