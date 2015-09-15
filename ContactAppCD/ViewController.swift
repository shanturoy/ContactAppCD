//
//  ViewController.swift
//  ContactAppCD
//
//  Created by Shantu Roy on 9/13/15.
//  Copyright (c) 2015 Rackspace. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func saveContact(sender: AnyObject) {
        let entityDescription =
        NSEntityDescription.entityForName("Contact",inManagedObjectContext: managedObjectContext!)
        
        let contact = Contact(entity: entityDescription!,insertIntoManagedObjectContext: managedObjectContext)
        
        contact.name = nameField.text
        contact.email = emailField.text
        contact.phone = phoneField.text
        
        var error: NSError?
        
        managedObjectContext?.save(&error)
        
        if let err = error {
            println(err.localizedFailureReason)
        } else {
            nameField.text = ""
            emailField.text = ""
            phoneField.text = ""
            println("Contact saved")
            var existingContacts = managedObjectContext!.countForFetchRequest(NSFetchRequest(entityName: "Contact"), error: nil) as Int
            println ("Existing number of contacts \(existingContacts)")
        }
    }
    
    //this is some random test
    
    @IBAction func deleteContact(sender: AnyObject) {
        let entityDescription =
        NSEntityDescription.entityForName("Contact",inManagedObjectContext: managedObjectContext!)
        
        let contact = Contact(entity: entityDescription!,insertIntoManagedObjectContext: managedObjectContext)
        contact.name = nameField.text
        contact.email = emailField.text
        contact.phone = phoneField.text
        
        var error: NSError?
        
        managedObjectContext?.deleteObject(contact)
        managedObjectContext?.save(&error)
        
        if let err = error {
            println(err.localizedFailureReason)
        } else {
            nameField.text = ""
            emailField.text = ""
            phoneField.text = ""
            println("Contact deleted")
            var existingContacts = managedObjectContext!.countForFetchRequest(NSFetchRequest(entityName: "Contact"), error: nil) as Int
            println ("Existing number of contacts \(existingContacts)")
        }
        
        
    }
    
    func displayAllRecords() {
        let entityDescription =
        NSEntityDescription.entityForName("Contact",inManagedObjectContext: managedObjectContext!)
        
        let contact = Contact(entity: entityDescription!,insertIntoManagedObjectContext: managedObjectContext)
        
        var contacts = managedObjectContext!.executeFetchRequest(NSFetchRequest(entityName: "Contact"), error: nil) as! [Contact]
        
        if contacts.count > 0 {
            for c in contacts {
                println("Name: \(c.name) Phone: \(c.phone) Email: \(c.email)")
            }
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayAllRecords()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

