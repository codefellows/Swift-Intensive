//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Michael Babiy on 6/28/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var nameTextField: UITextField
    @IBOutlet var emailTextField: UITextField
    
    var document: UIManagedDocument!
    var documentIsReady = false
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        if !document {
            createDocument()
        } else {
            prepareDocument()
        }
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func save(sender: UIButton)
    {
        Person.personWithName(nameTextField.text, email: emailTextField.text, context: document.managedObjectContext)
    }
    
    @IBAction func fetch(sender: UIButton)
    {
        let request = NSFetchRequest(entityName: "Person")
        var error: NSError?
        let results: Array <Person> = document.managedObjectContext.executeFetchRequest(request, error: &error) as Array
        
        if let fetchError = error {
            println(fetchError.localizedDescription)
        }
        
        for item in results {
            let person = item as Person
            println(person)
        }
    }
    
    func createDocument() -> Void
    {
        let documentsDirectories = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory = documentsDirectories[0] as String
        let documentURLPath = documentsDirectory.stringByAppendingPathComponent("Database")
        let documentURL = NSURL(fileURLWithPath: documentURLPath)
        document = UIManagedDocument(fileURL: documentURL)
        prepareDocument()
    }
    
    func prepareDocument() -> Void
    {
        if !NSFileManager.defaultManager().fileExistsAtPath(document.fileURL.path) {
            document.saveToURL(document.fileURL, forSaveOperation: UIDocumentSaveOperation.ForCreating, completionHandler: {
                success in
                if success {
                    self.documentIsReady = true
                }
            })
            
        } else {
            switch document.documentState {
                
            case UIDocumentState.Closed:
                document.openWithCompletionHandler({
                    success in
                    if success {
                        self.documentIsReady = true
                    }
                })
                
            case UIDocumentState.Normal:
                self.documentIsReady = true
                
            default:
                self.documentIsReady = false
            }
        }
    }

}

