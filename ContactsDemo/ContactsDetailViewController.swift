//
//  ContactsDetailViewController.swift
//  ContactsDemo
//
//  Created by woofgl on 16/1/4.
//  Copyright © 2016年 woofgl. All rights reserved.
//

import UIKit
import Contacts

class ContactsDetailViewController: UIViewController {
    
    @IBOutlet var contactsLabel: UILabel!
    @IBOutlet var contactsPhone: UILabel!
    @IBOutlet var contactsEmail: UILabel!
    
    var contactGivenName: NSString = ""
    var contactFamilyName: NSString = ""
    var contactOrganizationName: NSString = ""
    var contactNote: NSString = ""
    var contactEmail = [CNLabeledValue]()
    var contactPhone = [CNLabeledValue]()
    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //set value to show
        contactsLabel.text = (contactGivenName as String) + " " + (contactFamilyName as String)
        contactsPhone.text = contactPhone.first?.value as? String
        contactsEmail.text = contactEmail.first?.value as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
