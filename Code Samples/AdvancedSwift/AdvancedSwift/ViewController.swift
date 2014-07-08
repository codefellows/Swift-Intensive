//
//  ViewController.swift
//  AdvancedSwift
//
//  Created by Bradley Johnson on 6/25/14.
//  Copyright (c) 2014 Bradley Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doSomethingWithName("Brad","Mr")
        
        
        var building = Building(address: "123 King Way", floors: 23, sqrft: 20000)
        var library = Library(address: "321 park ave", floors: 12, sqrft: 10000) //inhertied inits
        var size = library.sqrft //inherited properties
        library.openDoors() //override method
        //then mark as final!
      //  var myBro = Bro<String>() should work LOL
        
        //generic function
       //myBro.doSomethingWithValue(123)
        
        //conforming to LogicValue protocol allows conditionals even when not an optional

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function with anonymous parameter title
    func doSomethingWithName(name : String, _ title : String) {
        
    }


}

