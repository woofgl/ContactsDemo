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
    
    var searchResults: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchDisplayController!.active {
            return searchResults.count
        }else{
            return ContactsDB.countContact()
        }
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
        
        if self.searchDisplayController!.active {
            if searchResults.isEmpty {
                cell.textLabel?.text = ""
            }else{
                cell.textLabel?.text = self.searchResults[indexPath.row]
            }
            
        } else {
            let contact = ContactsDB.getContactByIndex(indexPath.row)
            cell.textLabel?.text = contact.givenName + " " + contact.familyName
        }
        
        return cell
    }
   
    // prepare for segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showContactsDetail" {
            
            let indexPath: NSIndexPath
            let destViewController = segue.destinationViewController as! ContactsDetailViewController
            destViewController.setViewController(self)
            
//            let indexPath = self.tableView.indexPathForSelectedRow
//            let contact = ContactsDB.getContactByIndex(indexPath!.row)
            
//            let objectGivenName = contact.givenName as NSString
//            let objectFamilyName = contact.familyName as NSString
//            let objectOrganizationName = contact.organizationName as NSString
//            let objectNote = contact.note as NSString
//            let objectEmails = contact.emailAddresses
//            let objectPhone = contact.phoneNumbers
//            
//            destViewController.contactGivenName = objectGivenName
//            destViewController.contactFamilyName = objectFamilyName
//            destViewController.contactOrganizationName = objectOrganizationName
//            destViewController.contactNote = objectNote
//            destViewController.contactEmail = objectEmails
//            destViewController.contactPhone = objectPhone
//            destViewController.contact = contact
//            destViewController.num = indexPath!.row
            
            destViewController.hidesBottomBarWhenPushed = true
            
            //when select a search result row
            if self.searchDisplayController!.active {
                
                indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                destViewController.num = indexPath.row
            } else {
                //when select a normal row
                let indexPath = self.tableView.indexPathForSelectedRow
                destViewController.num = indexPath!.row
            }
        }
        
        if segue.identifier == "addcontacts" {
            let AddConViewController = segue.destinationViewController as! AddContactsViewController
            AddConViewController.setViewController(self)
        }
        
    }
    
    //refresh table view
    func refreshData(){
        self.tableView.reloadData()
    }
    
    //button for edit contact
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // Delete the row from the data source
        if editingStyle == .Delete {
            ContactsDB.remove(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        // Request table view to reload
        tableView.reloadData()
    }
    
    func filterContentForSearchText (searchText: String) {
        searchResults = ContactsDB.listContactName().filter{
            $0.localizedCaseInsensitiveContainsString("\(searchText)")
        }
    }
    
    func searchDisplayController(controller: UISearchController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText (searchString)
        return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            self.performSegueWithIdentifier("showContactsDetail", sender: self)
        }
    }
}

