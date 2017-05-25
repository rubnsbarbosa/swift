import UIKit

struct Contact {
    
    var name: String
    var phone: String
    var email: String
    
    init(name: String, phone: String, email: String) {
        self.name = name
        self.phone = phone
        self.email = email
    }
    
}

class AgendaContado {
    
    
    // Array
    var contact = [Contact]()
    
    func adcNewContact(name: String, phone: String, email: String) {
        contact.append(Contact(name: name, phone: phone, email: email))
    }
    
    func delContact(indexRemove: Int) {
        if contact.isEmpty == true {
            print("empty")
        } else {
            for (i, _) in contact.enumerated() {
                if indexRemove == i {
                    contact.remove(at: i)
                }
            }
        }
    }
    
    func changeContact(changeNameIndex: Int, changeName: String) {
        if contact.isEmpty == true {
            print("empty")
        } else {
            for (index, _) in contact.enumerated() {
                if index == changeNameIndex {
                    contact[index].name = changeName
                }
            }
        }
    }
    
    func listContacts() {
        if contact.isEmpty == true {
            print("empty")
        } else {
            for i in contact {
                print(i)
            }
        }
    }
    
    func listContactsInOrder() {
        if contact.isEmpty == true {
            print("empty")
        } else {
            
            let contactsOrder = contact.sorted{ $0.name < $1.name }
            print(contactsOrder)
        }
    }
    
}

var agenda = AgendaContado()
agenda.adcNewContact(name: "rubens", phone: "888-999", email: "rubens@icloud.com")
print(agenda.contact)

agenda.delContact(indexRemove: 0)
print(agenda.contact)

agenda.adcNewContact(name: "a", phone: "888-999", email: "a@icloud.com")
agenda.adcNewContact(name: "b", phone: "333-999", email: "b@icloud.com")
agenda.adcNewContact(name: "c", phone: "222-999", email: "c@icloud.com")
agenda.adcNewContact(name: "d", phone: "777-999", email: "d@icloud.com")
agenda.adcNewContact(name: "e", phone: "555-999", email: "e@icloud.com")

agenda.listContactsInOrder()
print(agenda.contact)

agenda.changeContact(changeNameIndex: 0, changeName: "ddd")
print(agenda.contact)

agenda.listContacts()

agenda.listContactsInOrder()
