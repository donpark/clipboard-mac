//
//  Arguments.swift
//  clipboard
//
//  Created by Don Park on 3/11/17.
//  Copyright © 2017 Docuverse. All rights reserved.
//

import Foundation

class Arguments {
    var args: Array<String>
    
    init(_ args: Array<String>) {
        self.args = args
    }
    
    var isEmpty: Bool {
        return args.isEmpty
    }
    
    func next(_ value: String? = nil) -> String? {
        guard !args.isEmpty else {
            return value
        }
        return args.removeFirst()
    }
}
