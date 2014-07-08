//
//  Library.swift
//  AdvancedSwift
//
//  Created by Bradley Johnson on 6/28/14.
//  Copyright (c) 2014 Bradley Johnson. All rights reserved.
//

import Foundation


class Library : Building {
    
    override func openDoors() {
        super.openDoors()
        println("Welcome to the Library. Be quiet!")
    }
    
}