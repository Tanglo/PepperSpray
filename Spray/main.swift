//
//  main.swift
//  PepperSpray
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
        keyPathArg++
    }
    let createKey = !flags.contains("p")
    var keyPath = ""
    if createKey{
        if (arguments.count < keyPathArg+1){
            keyPath = "./key.csv"
        } else{
            keyPath = arguments[keyPathArg]
        }
    } else {
        keyPathArg--
    }
    let overwriteOriginals = flags.contains("o")
    var newLocation = ""
    if !overwriteOriginals{
        if (arguments.count > keyPathArg+1){
            newLocation = arguments[keyPathArg+1]
        }
    }
    
    print("Main: createKey - \(createKey)")
    print("Main: overwriteOriginals - \(overwriteOriginals)")
    print("Main: keyPath - \(keyPath)")
    print("Main: newLocation - \(newLocation)")
    //Ready to go
    var filenames = [NSURL]()
    let workingDirectoryString = NSString(string: arguments[0]).stringByDeletingLastPathComponent
    print("\(workingDirectoryString)")
    let workingDirectoryURL = NSURL(fileURLWithPath: workingDirectoryString, isDirectory: true)
    do{
        let filenames = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(NSURL(fileURLWithPath: arguments[0], isDirectory: true), includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles)
    } catch {
        let nsError = (error as NSError)
        print("\(nsError.localizedDescription)")
        exit(Int32(nsError.code))
    }
    print("\(filenames)")
}

