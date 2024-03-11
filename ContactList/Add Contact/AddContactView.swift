//
//  AddContactView.swift
//  ContactList
//
//  Created by Gagana Ananda on 3/11/24.
//


import UIKit

class AddContactView: UIView {
    
    var name: UITextField!
    var email: UITextField!
    var phone:UITextField!
    var address: UITextField!
    var city: UITextField!
    var zip: UITextField!
    var buttonTakePhoto: UIButton!
    var buttonSelectType: UIButton!
    var saveButton: UIButton!
    var photoTitle: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupName()
        setupbuttonTakePhoto()
        setupEmail()
        setupbuttonSelectType()
        setupPhone()
        setupAddress()
        setupCity()
        setupZipcode()
        setupSaveButton()
        setupPhotoLabel()
        initConstraints()
        
    }
    
    func setupName(){
        name = UITextField()
        name.placeholder = "Name"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.borderStyle = .roundedRect
        self.addSubview(name)
    }
    
    func setupPhotoLabel(){
        photoTitle = UILabel()
        photoTitle.translatesAutoresizingMaskIntoConstraints = false
        photoTitle.text = "Photo"
        photoTitle.font = UIFont.systemFont(ofSize: 24)
        photoTitle.textColor = UIColor.darkGray
        self.addSubview(photoTitle)
    }
    
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "person.fill"), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.tintColor = .black
        self.addSubview(buttonTakePhoto)
    }
    
    func setupEmail(){
        email = UITextField()
        email.placeholder = "Email"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        self.addSubview(email)
    }
    

    
    func setupbuttonSelectType(){
        buttonSelectType = UIButton(type: .system)
        buttonSelectType.setTitle(Utilities.phoneTypes[0], for: .normal)
        buttonSelectType.translatesAutoresizingMaskIntoConstraints = false
        buttonSelectType.showsMenuAsPrimaryAction = true
        self.addSubview(buttonSelectType)
    }
    

    
    func setupPhone(){
        phone = UITextField()
        phone.placeholder = "Phone number"
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.borderStyle = .roundedRect
        phone.keyboardType = .phonePad
        self.addSubview(phone)
    }
    
    func setupAddress(){
        address = UITextField()
        address.placeholder = "Address"
        address.translatesAutoresizingMaskIntoConstraints = false
        address.borderStyle = .roundedRect
        self.addSubview(address)
    }
    
    func setupCity(){
        city = UITextField()
        city.placeholder = "City, State"
        city.translatesAutoresizingMaskIntoConstraints = false
        city.borderStyle = .roundedRect
        self.addSubview(city)
    }
    
    func setupZipcode(){
        zip = UITextField()
        zip.placeholder = "ZIP"
        zip.translatesAutoresizingMaskIntoConstraints = false
        zip.borderStyle = .roundedRect
        zip.keyboardType = .numberPad
        self.addSubview(zip)
    }
    
    func setupSaveButton(){
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(saveButton)
    }

    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            name.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            photoTitle.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 12),
            photoTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            email.topAnchor.constraint(equalTo: photoTitle.bottomAnchor, constant: 12),
            email.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            email.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
                        
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 12),
            phone.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            phone.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -80),
            
            buttonSelectType.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 12),
            buttonSelectType.leadingAnchor.constraint(equalTo: phone.trailingAnchor, constant: 8),
            buttonSelectType.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            address.topAnchor.constraint(equalTo: buttonSelectType.bottomAnchor, constant: 12),
            address.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            address.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            city.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 12),
            city.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            city.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            zip.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 12),
            zip.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            zip.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            saveButton.topAnchor.constraint(equalTo: zip.bottomAnchor, constant: 12),
            saveButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
