//
//  help.swift
//  PepperSpray
//
//  Created by Lee Walsh on 15/01/2016.
//  Copyright © 2016 Lee David Walsh. All rights reserved.
//

import Foundation

class PSHelp{
    
    class func printHelp(){
        print("usage: spray <key>")
        print("  <key>\tDeblinding key will be created at this path")
        print("")
        print("usage: wash <key>")
        print("  <key>\tThe deblinding key to wash with")
    }
}