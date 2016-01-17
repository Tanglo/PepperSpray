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
        print("usage: spray [-flags] <key>")
        print("  <key>\tDeblinding key will be created at this path")
        print("  p\tpermanent: no key file is generated")
        print("")
        print("usage: wash [-flags] <key>")
        print("  <key>\tThe deblinding key to wash with")
    }
}