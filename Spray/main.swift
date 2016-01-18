//
//  main.swift
//  PepperSpray
//
//  Created by Lee Walsh on 15/01/2016.
//  Copyright © 2016 Lee David Walsh. All rights reserved.
//

import Foundation

let arguments = NSProcessInfo.processInfo().arguments
let workingDirectoryString = String(NSString(string: arguments[0]).stringByDeletingLastPathComponent)
var nextArg = 1
if (arguments.count > nextArg) && (arguments[1] == "-h"){
    PSHelp.printHelp()
    exit(0)
} else {
    //Get flags
    var flags = PSFlags("")
    if arguments.count > nextArg{
        let index = arguments[1].startIndex
        if arguments[1][index] == "-"{
            flags = PSFlags(arguments[nextArg])
            nextArg++
        }
    }
    let createKey = !flags.contains("p")
    var keyPath = workingDirectoryString
    if (arguments.count > nextArg){
        let index = arguments[1].startIndex
        if !(arguments[nextArg][index] == "-"){
            keyPath = arguments[nextArg]
            nextArg++
        }
    }
    var sourcePath = workingDirectoryString
    if (arguments.count > nextArg+1) && (arguments[nextArg] == "-s"){
        sourcePath = arguments[nextArg+1]
        nextArg += 2
    }
    let overwriteFiles = flags.contains("o")
    var destinationPath = workingDirectoryString
    if (arguments.count > nextArg+1) && (arguments[nextArg] == "-d"){
        destinationPath = arguments[nextArg+1]
        nextArg += 2
    }
    print("Main: flags - \(flags)")
    print("Main: key? - \(createKey), keyPath - \(keyPath)")
    print("Main: sourcePath - \(sourcePath)")
    print("Main: overwrite? - \(overwriteFiles), destinationPath - \(destinationPath)")

    //Ready to go
    var filenames = [NSURL]()
    do{
        filenames = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(NSURL(fileURLWithPath: sourcePath, isDirectory: true), includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles)
    } catch {
        let nsError = (error as NSError)
        print("\(nsError.localizedDescription)")
        exit(Int32(nsError.code))
    }
    print("\(filenames)")
}

