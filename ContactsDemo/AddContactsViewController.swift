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
    var _viewController: ViewController = ViewController.init()
    var contact: CNMutableContact = CNMutableContact.init()
    
    var rightButtonItem:UIBarButtonItem?
    var leftButtonItem: UIBarButtonItem?
    var contacts: [CNMutableContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

            notes.text = contact.note
            company.text = contact.organizationName
            email.text = contact.emailAddresses.first?.value as? String
            phone.text = contact.phoneNumbers.first?.value as? String
            lastname.text = contact.familyName
            firstname.text = contact.givenName
        
        setupRightBarButtonItem()
        setupLeftBarButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //setup right button
    func setupRightBarButtonItem() {
        rightButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self,action: "rightBarButtonItemClicked")
        navigationItem.rightBarButtonItem = self.rightButtonItem
        
    }
    
    //event for right button, save data
    func rightBarButtonItemClicked(){
        let newContact = CNMutableContact()
        newContact.givenName = firstname.text!
        newContact.familyName = lastname.text!
        newContact.organizationName = company.text!
        newContact.note = notes.text!
        
        let homeEmail = CNLabeledValue(label: CNLabelHome, value: email.text!)
//        newContact.emailAddresses.append(homeEmail)
        newContact.emailAddresses = [homeEmail]
        
//        let phoneNum = CNLabeledValue(label: CNLabelPhoneNumberiPhone, value: phone.text!)
        newContact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue: phone.text!))]
        
        ContactsDB.addContact(newContact)
        
        (self.parentViewController as! UINavigationController).popViewControllerAnimated(true)
        self._viewController.refreshData()
        
    }
    
    //setup left button
    func setupLeftBarButtonItem(){
        leftButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self,action: "backToPrevious")
        navigationItem.leftBarButtonItem = self.leftButtonItem
    }
    
    //event for left button, back to previous page
    func backToPrevious(){
       self.navigationController?.popViewControllerAnimated(true)
    }
    
    func setViewController(viewController: ViewController){
        _viewController = viewController;
    }
}
