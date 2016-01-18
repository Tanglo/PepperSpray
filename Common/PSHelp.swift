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
        print("Use pspray to blind, and wash to deblind.")
        print("usage: pspray [-po] [<key>] [-s <source>] [-d <destination>]")
        print("  By default pspray will create new blinded files (i.e. preserve originals) and create a file <destination>/key.csv for use with wash to deblind")
        print("    <source>\tPath to the files to be blinded, default is working directory.  All files in this directory will be processed")
        print("    <destination>\tBlinded files will be placed here, default is working directory.  Ignored if -o flag is set")
        print("    flags:")
        print("      -p\tpermanent: No key file is generated")
        print("      -o\toverwrite: Files will not be copied, i.e. original files will be lost!")
        print("")
        
        print("usage: wash [-flags] <key>")
        print("  <key>\tThe deblinding key to wash with")
    }
}