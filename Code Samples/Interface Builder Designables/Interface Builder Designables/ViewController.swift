//
//  ViewController.swift
//  Interface Builder Designables
//
//  Created by John Clem on 6/24/14.
//  Copyright (c) 2014 Learn Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        NSOperationQueue().addOperationWithBlock {
        }
        
        
        var view = UIView()
        var imageView = view as UIImageView
        
//        if let newView = imageView as? UIView {
//            
//        }
        
    }

    class UserPortrait {
        
    }

}

let vc = ViewController()

let portrait = ViewController.UserPortrait()

let view = UIKit.UIView()
