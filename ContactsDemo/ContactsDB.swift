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
    
    static func editContact(contact: CNMutableContact, num: Int){
        contacts[num].setValue(contact.givenName, forKey: "givenName")
        contacts[num].setValue(contact.familyName, forKey: "familyName")
        contacts[num].setValue(contact.organizationName, forKey: "organizationName")
        contacts[num].setValue(contact.phoneNumbers, forKey: "phoneNumbers")
        contacts[num].setValue(contact.emailAddresses, forKey: "emailAddresses")
        contacts[num].setValue(contact.note, forKey: "note")
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
    
    static func listContactName() -> [String] {
        var contactNames: [String] = []
        for contact in contacts{
            contactNames.append(contact.givenName + contact.familyName)
        }
        return contactNames
    }
    
}
