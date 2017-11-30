//
//  main.swift
//  ozark
//
//  Created by Chase on 6/27/17.
//  Copyright © 2017 Finch Software. All rights reserved.
//

import Foundation

let usage: String = """

Usage: ozark <classpath> --method <methodname>

where <classpath> is a relative or absolute path to an Ozark class file, and <methodname> is the name of the initial method run on program execution.

"""

func stderr(_ string: String) {
    if let data = (string + "\n").data(using: .utf8) {
        FileHandle.standardError.write(data)
    }
}

func stdout(_ string: String) {
    if let data = (string + "\n").data(using: .utf8) {
        FileHandle.standardOutput.write(data)
    }
}

var executable = CommandLine.arguments[0]
var methodName: String?
var className: String?

var methodIndex: Int?

do {
    for (index, param) in CommandLine.arguments.enumerated() where index > 0 {
        if param == "--method" {
            guard methodName == nil else { throw UsageError.InvalidParameters }
            
            methodIndex = index + 1

        } else if index == methodIndex {
            methodName = param

        } else if className == nil {
            className = param

        } else { throw UsageError.InvalidParameters }
    }

    guard let className = className else { throw UsageError.InvalidParameters }
    guard let methodName = methodName else { throw UsageError.InvalidParameters }
    
    stdout(className + " " + methodName + "\n")

} catch is UsageError {
    stderr(usage + "\n" + executable)
}


