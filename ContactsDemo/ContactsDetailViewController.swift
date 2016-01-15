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
    var contact: CNMutableContact = CNMutableContact.init()
    var num: Int = 0
    
    var _viewController: ViewController = ViewController.init()
    
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
    
    func setupRightBarButtonItem(){
       let rightBarButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "rightBarButtonItemClicked")
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func setViewController(viewController: ViewController){
        _viewController = viewController;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editContact"{
            let destViewController = segue.destinationViewController as! AddContactsViewController
            
            destViewController.contact = self.contact
            destViewController.num = self.num
            destViewController.isEdit = true
        }
    }
    
    

}
