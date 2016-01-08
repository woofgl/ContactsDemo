//
//  AddContactsViewController.swift
//  ContactsDemo
//
//  Created by woofgl on 16/1/7.
//  Copyright © 2016年 woofgl. All rights reserved.
//

import UIKit
import Contacts


class AddContactsViewController: UIViewController {
    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var rightButtonItem:UIBarButtonItem?
    var contacts: [CNMutableContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var contactValue:CNContact{
            let contact = CNMutableContact()
            contact.givenName = firstname.text!
            contact.familyName = lastname.text!
            return contact
            
        }
        
        setupRightBarButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupRightBarButtonItem() {
        rightButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self,action: "rightBarButtonItemClicked")
        navigationItem.rightBarButtonItem = self.rightButtonItem
        
    }
    
    
    func rightBarButtonItemClicked(){
        let newContact = CNMutableContact()
        newContact.givenName = firstname.text!
        newContact.familyName = lastname.text!
        newContact.organizationName = company.text!
        newContact.note = notes.text!
        
        let homeEmail = CNLabeledValue(label: CNLabelHome, value: email.text!)
        newContact.emailAddresses.append(homeEmail)
        
        contacts.append(newContact)
        
        (self.parentViewController as! UINavigationController).popViewControllerAnimated(true)
    }
}
