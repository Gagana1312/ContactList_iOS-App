//
//  ContactViewController.swift
//  ContactList
//
//  Created by Gagana Ananda on 3/11/24.
//

import UIKit

class ContactViewController: UIViewController {

    let contactView = ContactView()
    var contact: Contact!
    var contactIndex: Int!
    var delegate:ViewController!
    override func loadView() {
        view = contactView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit", style: .plain, target: self,
            action: #selector(onEditBarButtonTapped)
        )
        setContactFields()
        // Do any additional setup after loading the view.
    }
    
    @objc func onEditBarButtonTapped(){
        let addContactController = AddContactViewController()
        addContactController.editContact(contactIndex, contact)
        addContactController.delegate = delegate
        addContactController.pickedImage = contact.image
        var viewControllers = navigationController?.viewControllers ?? []
        if let index = viewControllers.lastIndex(where: { $0 is ContactViewController }){
            viewControllers[index] = addContactController
        }
        navigationController?.setViewControllers(viewControllers, animated: true)

    }
    
    func setContactFields(){
        contactView.imageReceipt.image = contact.image
        contactView.name.text = "\(contact.name!)"
        contactView.email.text = "Email: \(contact.email!)"
        contactView.phone.text = "Phone: \(contact.phoneNumber!) (\(contact.phoneType!))"
        contactView.address.text = "\(contact.address!)"
        contactView.city.text = "\(contact.city!)"
        contactView.zip.text = "\(contact.zipcode!)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
