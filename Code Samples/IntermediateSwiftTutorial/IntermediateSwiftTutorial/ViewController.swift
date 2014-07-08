//
//  ViewController.swift
//  IntermediateSwiftTutorial
//
//  Created by Bradley Johnson on 6/27/14.
//  Copyright (c) 2014 Bradley Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //2 creating a variable to hold the function
    var miscFunc : (name : String) -> () = doSomething
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //4 calling it with our function as ap roperty
        self.doSomethingWithName("Brad", funcAsParam: self.miscFunc)
        
        //5calling the same function with a closure expression
        self.doSomethingWithName("Brad", funcAsParam: {
            //can get rid of String here and return expression
            (name: String)->() in
            //code
            })
        //6 calling it with a trailing closure
        self.doSomethingWithName("Brad"){ (name: String) -> () in
        //code
        }
        
    }
    //3 heres a method that takes a function as a parameter
    func doSomethingWithName(name : String, funcAsParam : (name : String) -> ()) -> (){
        
        funcAsParam(name: name)
    }

}
// 1 functions are first class, define this function and then store it in a variable
func doSomething(name : String) -> () {}





