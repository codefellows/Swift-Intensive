//
//  Building.swift
//  AdvancedSwift
//
//  Created by Bradley Johnson on 6/28/14.
//  Copyright (c) 2014 Bradley Johnson. All rights reserved.
//

import Foundation

class Building {
    
    var address = "NA"
    var floors = 0
    var sqrft = 0
    var isOpen = false
    
    init(address: String, floors : Int, sqrft : Int) {
        self.address = address
        self.floors = floors
        self.sqrft = 0
    }
    
    func openDoors() {
        self.isOpen = true
    }
}