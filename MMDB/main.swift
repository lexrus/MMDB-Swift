//
//  main.swift
//  tc
//
//  Created by Lex on 12/16/15.
//  Copyright © 2015 LexTang.com. All rights reserved.
//

import Foundation

func main(arguments: [String]) {
    guard let HOME = NSProcessInfo.processInfo().environment["HOME"] else {
        return
    }
    
    guard let db = MMDB("\(HOME)/Desktop/GeoLite2-Country.mmdb") else {
        print("failed to open db.")
        return
    }
    
    if let country = db.lookup("8.8.8.8") {
        print(country)
    } else {
        print("nothing found.")
    }
}

main(Process.arguments)
