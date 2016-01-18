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
        print("Use pspray to blind, and wash to deblind.  By default pspray will copy files before blinding.")
        print("usage: pspray [-flags] [ <key> | <source> | <destination> ]")
        print("  <key>\tDeblinding key will be created at this path.  Excluded if -p flag is set")
        print("  <destination>\tBlinded files will be placed here.  Ignored if -o flag is set")
        print("  flags:")
        print("    p\tpermanent: no key file is generated")
        print("    o\toverwrite: WARNING: files will not be copied, original files will be lost!")
        print("")
        print("usage: wash [-flags] <key>")
        print("  <key>\tThe deblinding key to wash with")
    }
}