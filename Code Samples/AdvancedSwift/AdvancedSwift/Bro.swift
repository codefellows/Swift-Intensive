//
//  Bro.swift
//  AdvancedSwift
//
//  Created by Bradley Johnson on 6/25/14.
//  Copyright (c) 2014 Bradley Johnson. All rights reserved.
//

import UIKit

class Bro : NSObject, LogicValue{
    
    
    var favoriteHobby : String?

    
    func getLogicValue() -> Bool {
        return true
    }
    
    func doSomethingWithValue<T>(value : T) {
        
    }
}
