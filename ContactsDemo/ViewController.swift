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
    
    var contacts: [String] = []
    var phones: [String] = []
    var emails: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //init contacts
        contacts = ["Egg Benedict 9", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini", ""]
        phones = ["11111111111", "22222222222", "33333333333", "4444444444", "5555555555", "66666666666", "77777777777", "88888888888","9999999999", "122222222222", "123333333333", "123455555555555","123456666666", "12345677777", "12345678888", "12345678999","1122222222222", "1112222222222", "11112222222", "1111112222222"]
        
        emails = ["www.Egg Benedict 9.com", "www.Mushroom Risotto.com", "wwww.Full Breakfast.com", "wwww.Hamburger.com", "www.Ham and Egg Sandwich.com", "www.Creme Brelee.com", "www.White Chocolate Donut.com", "www.Starbucks Coffee.com", "www.Vegetable Curry.com", "www.Instant Noodle with Egg.com", "www.Noodle with BBQ Pork.com", "www.Japanese Noodle with Pork.com", "www.Green Tea.com", "www.Thai Shrimp Cake.com", "www.Angry Birds Cake.com", "www.Ham and Cheese Panini.com", ""]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
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
        
        cell.textLabel?.text = contacts[indexPath.row]
        
        return cell
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showContactsDetail" {
            
            let destViewController = segue.destinationViewController as! ContactsDetailViewController
        
            let indexPath = self.tableView.indexPathForSelectedRow
            let object: NSString = contacts[indexPath!.row] as NSString
            let objectNum: NSString = phones[indexPath!.row] as NSString
            let objectEmail: NSString = emails[indexPath!.row] as NSString
            
            destViewController.contactsName = object
            destViewController.contactsNumber = objectNum
            destViewController.contactsEmails = objectEmail
            
            destViewController.hidesBottomBarWhenPushed = true
        }
    }


}

