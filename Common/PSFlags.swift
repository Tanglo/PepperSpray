//
//  PSFlags.swift
//  PepperSpray
//
//  Created by Lee Walsh on 15/01/2016.
//  Copyright © 2016 Lee David Walsh. All rights reserved.
//

import Foundation

class PSFlags: CustomStringConvertible {
    private var flags = [Character]()
    
    var count: Int{
        return flags.count
    }
    
    var description: String {
        var string = ""
        for flag in flags{
            string += "\(flag)"
        }
        return string
    }
   
    init(_ argument: String){
        let letterSet = NSCharacterSet.letterCharacterSet()
        for flag in argument.characters {
            if letterSet.characterIsMember(String(flag).utf16[String(flag).utf16.startIndex]){
                flags.append(flag)
            }
        }
    }
    
    func contains(flag: Character) -> Bool{
        for currentFlag in flags{
            if currentFlag == flag{
                return true
            }
        }
        return false
    }
}