//
//  ContactsDB.swift
//  ContactsDemo
//
//  Created by woofgl on 16/1/11.
//  Copyright © 2016年 woofgl. All rights reserved.
//

import UIKit
import Contacts

class ContactsDB: NSObject {
    @IBOutlet var tableView: UITableView!

    
    private static var contacts: [CNMutableContact] = [];
    
    static func addContact(contact: CNMutableContact){
        contacts.append(contact)
    }
    
    static func listContact() -> [CNMutableContact]{
        return contacts
    }
    
    static func countContact() -> Int{
        return contacts.count
    }
    
    static func getContactByIndex(index: Int) -> CNMutableContact{
        return contacts[index]
    }
    
    static func remove(indexPath: Int){
        contacts.removeAtIndex(indexPath)
    }
    
}
