//
//  ViewController.swift
//  ContactList
//
//  Created by Gagana Ananda on 3/11/24.
//

import UIKit

class ViewController: UIViewController {
    let firstScreen = FirstScreenView()
    var contacts = [Contact]()
    
//    let dummyContact = Contact(name: "John Doe",
//                               email: "johndoe@example.com",
//                               phoneType: "Cell",
//                               phoneNumber: "1234567890",
//                               address: "123 Main St",
//                               city: "Anytown",
//                               zipcode: "12345",
//                               image: (UIImage(systemName: "person.fill"))!)
//
//    let anotherDummyContact = Contact(name: "Jane Smith",
//                                      email: "janesmith@example.com",
//                                      phoneType: "Home",
//                                      phoneNumber: "987-654-3210",
//                                      address: "456 Elm St",
//                                      city: "Sometown",
//                                      zipcode: "54321")
//
    
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
//        contacts.append(dummyContact)
//        contacts.append(anotherDummyContact)
        firstScreen.tableViewContact.delegate = self
        firstScreen.tableViewContact.dataSource = self
        firstScreen.tableViewContact.separatorStyle = .none
        firstScreen.tableViewContact.separatorColor = .clear
    }
    
    func delegateOnEditContact(index: Int, contact: Contact){
        contacts[index] = contact
        firstScreen.tableViewContact.reloadData()
    }
    
    func delegateOnAddContact(contact: Contact){
        contacts.append(contact)
        firstScreen.tableViewContact.reloadData()
    }
    
    @objc func onAddBarButtonTapped(){
        let addContactController = AddContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactCell
        cell.labelName.text = contacts[indexPath.row].name
        cell.labelEmail.text = contacts[indexPath.row].email
        if let phoneNumber = contacts[indexPath.row].phoneNumber, let cellType = contacts[indexPath.row].phoneType{
            cell.labelPhone.text = "\(phoneNumber) (\(cellType))"
        }
        if let uwImage = contacts[indexPath.row].image{
            cell.imageReceipt.image = uwImage
        }
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactView = ContactViewController()
        contactView.contact = contacts[indexPath.row]
        contactView.contactIndex = indexPath.row
        contactView.delegate = self
        navigationController?.pushViewController(contactView, animated: true)
        firstScreen.tableViewContact.deselectRow(at: indexPath, animated: true)
    }
    
    
}


