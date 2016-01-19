//
//  main.swift
//  PepperSpray
//
//  Created by Lee Walsh on 15/01/2016.
//  Copyright © 2016 Lee David Walsh. All rights reserved.
//  This sofware is licensed under the The MIT License (MIT)
//  See: https://github.com/Tanglo/PepperSpray/blob/master/LICENSE.md
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
        var isDirectory: ObjCBool = true
        NSFileManager.defaultManager().fileExistsAtPath(sourcePath, isDirectory: &isDirectory)
        if !isDirectory{
            print("Error: <source> is not a directory")
            exit(-1407)     //code for getting a file instead of an folder
        }
        nextArg += 2
    }
    let overwriteFiles = flags.contains("o")
    var destinationPath = workingDirectoryString
    if (arguments.count > nextArg+1) && (arguments[nextArg] == "-d"){
        destinationPath = arguments[nextArg+1]
        nextArg += 2
    }
/*    print("Main: flags - \(flags)")
    print("Main: key? - \(createKey), keyPath - \(keyPath)")
    print("Main: sourcePath - \(sourcePath)")
    print("Main: overwrite? - \(overwriteFiles), destinationPath - \(destinationPath)")
*/
    
    //Get the keyPath ready to create or overwrite a file
    var isDirectory: ObjCBool = true
    let keyFileExists = NSFileManager.defaultManager().fileExistsAtPath(keyPath, isDirectory: &isDirectory)
//    print("\(keyFileExists), \(isDirectory)")
    if keyFileExists{
        if !isDirectory{
            var response: String? = "a"
            while (response != "y") && (response != "n"){
                print("Overwrite existing key file: \(keyPath)? (y/n)")
                response = readLine()
            }
            if response == "n"{
                exit(0)
            }
        } else if keyPath.characters.last! != "/"{      //if is directory without a /
            keyPath += "/key.csv"
        } else{                                         //directory with a /
            keyPath += "key.csv"
        }
    } else if keyPath.characters.last! == "/"{          //if user specified an non-existant path ending in a /
        do{                                             //try to create the new directory
            try NSFileManager.defaultManager().createDirectoryAtPath(keyPath, withIntermediateDirectories: true, attributes: nil)
        } catch{
            let nsError = (error as NSError)
            print("\(nsError.localizedDescription)")
            exit(Int32(nsError.code))
        }
        keyPath += "key.csv"
    }
//    print("keyPath: \(keyPath)")
    
    //Get the destination path and fileStem ready
    let destinationExists = NSFileManager.defaultManager().fileExistsAtPath(destinationPath, isDirectory: &isDirectory)
    var fileStem = "file"
    if destinationExists{
        if !isDirectory{
            fileStem = String(NSString(string: destinationPath).lastPathComponent)
            destinationPath = String(NSString(string: destinationPath).stringByDeletingLastPathComponent)
        }
    } else if destinationPath.characters.last! == "/"{          //if user specified an non-existant path ending in a /
        do{                                             //try to create the new directory
            try NSFileManager.defaultManager().createDirectoryAtPath(keyPath, withIntermediateDirectories: true, attributes: nil)
        } catch{
            let nsError = (error as NSError)
            print("\(nsError.localizedDescription)")
            exit(Int32(nsError.code))
        }
    } else{
        fileStem = String(NSString(string: destinationPath).lastPathComponent)
        destinationPath = String(NSString(string: destinationPath).stringByDeletingLastPathComponent)
    }
//    print("destStem: \(fileStem)")
//    print("destPath: \(destinationPath)")
    
    //Ready to go
    var filenames = [NSURL]()
    do{
        filenames = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(NSURL(fileURLWithPath: sourcePath, isDirectory: true), includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles)
    } catch {
        let nsError = (error as NSError)
        print("\(nsError.localizedDescription)")
        exit(Int32(nsError.code))
    }
//    print("\(filenames)")
    
    var labels = [Int]()
    for i in 0...filenames.count{
        labels.append(i)
    }
//    print("\(labels)")
    for url in filenames{
        let fileSourcePath = url.path!
        let fileDestinationPathStem = destinationPath + "/" + fileStem
        let fileExtension = NSString(string: url.path!).pathExtension
        let numberIndex = Int(arc4random_uniform(UInt32(filenames.count)))
        let number = "\(labels[numberIndex])"
        labels.removeAtIndex(numberIndex)
        let numberString = number.stringByPaddingToLength(5, withString: "0", startingAtIndex: 0)
        number.str
        
        print("source: \(fileSourcePath)")
        print("destination: \(fileDestinationPathStem)")
        print("fileExtension: \(fileExtension)")
        print("numberString: \(numberString)")
    }
    
    
}

