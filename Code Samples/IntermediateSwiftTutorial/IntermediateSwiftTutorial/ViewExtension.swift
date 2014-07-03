//
//  ViewExtension.swift
//  IntermediateSwiftTutorial
//
//  Created by Bradley Johnson on 6/27/14.
//  Copyright (c) 2014 Bradley Johnson. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    //1 add a computed property - dont need get because they are always read only
    var area : CGFloat { return self.frame.width * self.frame.height }
    //2 add an instance method, if this was a struct we would need mutating keyword
    func changeToColor(color : UIColor) {
        self.backgroundColor = color
    }


}