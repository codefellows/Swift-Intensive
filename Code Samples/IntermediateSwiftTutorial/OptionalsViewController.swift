//
//  OptionalsViewController.swift
//  IntermediateSwiftTutorial
//
//  Created by Bradley Johnson on 6/27/14.
//  Copyright (c) 2014 Bradley Johnson. All rights reserved.
//

import UIKit

class OptionalsViewController: UIViewController {
    
    //1 basic optional property
    var personView : UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.personView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        //implicit unwrap
        //self.personView!.center = CGPoint(x: 20, y: 20)
        
        //2 optional binding
        if let view = self.personView {
            //do something with view
//            view.center = CGPoint(x: 20, y: 20) //no unwrapping, optional binding unwraps it for you in the constant
        } else {
            //self.personView was nil
        }
        
        //3 optional chaining - can also call functions with optional chaining (just dont use let)
        
        if let parentView = self.personView?.superview {
            //view has a superView
        }
        else {
            //view has no superview
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
