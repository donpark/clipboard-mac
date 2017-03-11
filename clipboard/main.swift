//
//  main.swift
//  clipboard
//
//  Created by Don Park on 3/10/17.
//  Copyright © 2017 Docuverse. All rights reserved.
//

import Foundation
import AppKit

//enum Command: String {
//    case list = "list"
//    case ls = "ls"
//    case get = "get"
//    case set = "set"
//    case add = "add"
//    case remove = "remove"
//    case rm = "rm"
//    case clear = "clear"
//    case copy = "copy"
//    case paste = "paste"
//}

let cli = CommandLine()

// MARK: Options

let help = BoolOption(shortFlag: "h", longFlag: "help",
                      helpMessage: "Prints a help message.")

cli.addOptions(help)

func usageExit(_ error: Error? = nil) {
    if error != nil {
        cli.printUsage(error!)
    } else {
        cli.printUsage()
    }
    exit(EX_USAGE)
}

extension FileHandle : TextOutputStream {
    public func write(_ string: String) {
        guard let data = string.data(using: .utf8) else { return }
        self.write(data)
    }
}

func listClipboard(_ args: Arguments) {
    let pb = NSPasteboard.general()
    guard let types = pb.types else {
        return
    }
    var stdout = FileHandle.standardOutput
    print(types, to: &stdout)
}

func getClipboard(_ args: Arguments) {
    guard let dataType = args.next() else {
        usageExit()
        return
    }
    
    let pb = NSPasteboard.general()
    if let data = pb.data(forType: dataType) {
        let stdout = FileHandle.standardOutput
        stdout.write(data)
    }
}

do {
    try cli.parse()
} catch {
    usageExit(error)
}

let args = Arguments(cli.unparsedArguments)
let cmd = args.next("list")
if cmd == nil {
    usageExit()
}

switch cmd!.lowercased() {
case "list", "ls":
    listClipboard(args)
case "get":
    getClipboard(args)
default:
    usageExit()
}

exit(EXIT_SUCCESS)
