//
//  AddContactViewController.swift
//  ContactList
//
//  Created by Gagana Ananda on 3/11/24.
//

import UIKit
import PhotosUI

class AddContactViewController: UIViewController {
    
    let addContactScreen = AddContactView()
    var selectedType = "Cell"
    var delegate:ViewController!
    var screenTitle = "Add Contact"
    var pickedImage:UIImage?
    var contactIndex: Int?
    
    override func loadView() {
        view = addContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = screenTitle
        // Do any additional setup after loading the view.
        addContactScreen.buttonTakePhoto.setImage(pickedImage?.withRenderingMode(.alwaysOriginal) ?? UIImage(systemName: "person.fill"), for: .normal)
        addContactScreen.buttonSelectType.menu = getMenuTypes()
        addContactScreen.buttonTakePhoto.menu = getMenuImagePicker()
        addContactScreen.saveButton.addTarget(self, action: #selector(onButtonSave), for: .touchUpInside)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    func editContact(_ index: Int, _ contact: Contact){
        contactIndex = index
        screenTitle = "Edit"
        addContactScreen.name.text = contact.name
        addContactScreen.email.text = contact.email
        addContactScreen.phone.text = contact.phoneNumber
        addContactScreen.buttonSelectType.setTitle(contact.phoneType, for: .normal)
        addContactScreen.address.text = contact.address
        addContactScreen.city.text = contact.city
        addContactScreen.zip.text = contact.zipcode
    }
    
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in Utilities.phoneTypes{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selectedType = type
                                self.addContactScreen.buttonSelectType.setTitle(self.selectedType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select Label", children: menuItems)
    }
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }

    
    func isValidZIPCode(_ zipCode: String) -> Bool {
        let zipCodeRegex = "^[0-9]{5}$"
        let zipCodePredicate = NSPredicate(format: "SELF MATCHES %@", zipCodeRegex)
        let isFiveDigits = zipCodePredicate.evaluate(with: zipCode)

        if isFiveDigits {
            if let zipInt = Int(zipCode), (zipInt >= 1 && zipInt <= 99950) {
                return true
            }
        }

        return false
    }

    func showAlertText(text:String){
        let alert = UIAlertController(
            title: "Alert!!!",
            message: "\(text)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneRegex = #"^\d{10}$"#
        guard let regex = try? NSRegularExpression(pattern: phoneRegex) else {
            return false
        }
        let range = NSRange(location: 0, length: phoneNumber.utf16.count)
        return regex.firstMatch(in: phoneNumber, options: [], range: range) != nil
    }
    
    @objc func onButtonSave(){
        if let name = addContactScreen.name.text, name.isEmpty {
            showAlertText(text: "Name field cannot be empty")
            return
        }

        if let email = addContactScreen.email.text, email.isEmpty {
            showAlertText(text: "Email field cannot be empty")
            return
        }else if let email = addContactScreen.email.text, !isValidEmail(email) {
            showAlertText(text: "Please enter a valid email address")
            return
        }

        if let phone = addContactScreen.phone.text, phone.isEmpty {
            showAlertText(text: "Phone field cannot be empty")
            return
        }else if let phone = addContactScreen.phone.text, !isValidPhoneNumber(phone) {
            showAlertText(text: "Please enter a valid phone number")
            return
        }

        if let address = addContactScreen.address.text, address.isEmpty {
            showAlertText(text: "Address field cannot be empty")
            return
        }

        if let city = addContactScreen.city.text, city.isEmpty {
            showAlertText(text: "City field cannot be empty")
            return
        }

        if let zip = addContactScreen.zip.text, zip.isEmpty {
            showAlertText(text: "Zip code field cannot be empty")
            return
        } else if let zip = addContactScreen.zip.text, !isValidZIPCode(zip) {
            showAlertText(text: "Invalid Zip code")
            return
        }
        
        let userContact = Contact(
            name: addContactScreen.name.text!,
            email: addContactScreen.email.text!,
            phoneType: selectedType,
            phoneNumber: addContactScreen.phone.text!,
            address: addContactScreen.address.text!,
            city: addContactScreen.city.text!,
            zipcode: addContactScreen.zip.text!,
            image: pickedImage ?? (UIImage(systemName: "person.fill"))!
        )
        
        if let index = contactIndex{
            delegate.delegateOnEditContact(index: index, contact: userContact)
        }else{
            delegate.delegateOnAddContact(contact: userContact)
        }
        
        navigationController?.popViewController(animated: true)

    }

}

extension AddContactViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
                
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addContactScreen.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

extension AddContactViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addContactScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            showAlertText(text: "Select Image")
        }
    }
}
