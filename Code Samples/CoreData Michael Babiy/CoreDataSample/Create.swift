//
//  Create.swift
//  CoreDataSample
//
//  Created by Michael Babiy on 6/28/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//

import Foundation

extension Person {
    
    class func personWithName(name: String, email: String, context: NSManagedObjectContext) -> Void
    {
        let person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: context) as Person
        person.name = name
        person.email = email
        
        var error: NSError?
        context.save(&error)
        
        if let saveError = error {
            println(saveError.localizedDescription)
        }
    }
    
    func description() -> String
    {
        return "Name: \(name) Email: \(email)"
    }
    
}