//
//  Token.swift
//  ozark
//
//  Created by Chase on 11/30/17.
//  Copyright © 2017 Finch Software. All rights reserved.
//

import Cocoa

class Token {
    
    enum Kind {
        case string
        case statement
        case infix
        case integer
        case number
        case boolean
        case type
        case property
    }
}
