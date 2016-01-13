//
//  ViewController.swift
//  ContactsDemo
//
//  Created by woofgl on 16/1/4.
//  Copyright © 2016年 woofgl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactsDB.countContact()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "ContactCell"
//        if indexPath.row % 2 == 1{
//            identifier = "ContactCell2"
//        }
        let cellOpt:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier);
        let cell:UITableViewCell
        if (cellOpt != nil){
            cell = cellOpt!;
        }else{
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        }
        
        let contact = ContactsDB.getContactByIndex(indexPath.row)
        cell.textLabel?.text = contact.givenName + " " + contact.familyName
        
        return cell
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showContactsDetail" {
            
            let destViewController = segue.destinationViewController as! ContactsDetailViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow
            let contact = ContactsDB.getContactByIndex(indexPath!.row)
            
            let objectGivenName = contact.givenName as NSString
            let objectFamilyName = contact.familyName as NSString
            let objectOrganizationName = contact.organizationName as NSString
            let objectNote = contact.note as NSString
            let objectEmails = contact.emailAddresses
            let objectPhone = contact.phoneNumbers
            
            destViewController.contactGivenName = objectGivenName
            destViewController.contactFamilyName = objectFamilyName
            destViewController.contactOrganizationName = objectOrganizationName
            destViewController.contactNote = objectNote
            destViewController.contactEmail = objectEmails
            destViewController.contactPhone = objectPhone
            
            destViewController.hidesBottomBarWhenPushed = true
        }
        
        if segue.identifier == "addcontacts" {
            let AddConViewController = segue.destinationViewController as! AddContactsViewController
            AddConViewController.setViewController(self)
        
        }
    }
    
    func refreshData(){
        self.tableView.reloadData()
    }


}

