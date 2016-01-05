//
//  ContactsDetailViewController.swift
//  ContactsDemo
//
//  Created by woofgl on 16/1/4.
//  Copyright © 2016年 woofgl. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController {
    
    @IBOutlet var contactsLabel: UILabel!
    @IBOutlet var contactsPhone: UILabel!
    @IBOutlet var contactsEmail: UILabel!
    
    var contactsName: NSString = ""
    var contactsNumber: NSString = ""
    var contactsEmails: NSString = ""

    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contactsLabel.text = contactsName as String
        contactsPhone.text = contactsNumber as String
        contactsEmail.text = contactsEmails as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
