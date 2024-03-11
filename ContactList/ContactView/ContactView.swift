//
//  ContactView.swift
//  ContactList
//
//  Created by Gagana Ananda on 3/11/24.
//

import UIKit

class ContactView: UIView {
    
    var imageReceipt: UIImageView!
    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    var addressStaticLabel: UILabel!
    var address: UILabel!
    var city: UILabel!
    var zip: UILabel!
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
        setupImage()
        setupName()
        setupEmail()
        setupPhone()
        setupAddressStaticLabel()
        setupAddress()
        setupCity()
        setupZipCode()
        
        initConstraints()
        
    }
    
    func setupImage(){
        imageReceipt = UIImageView()
        imageReceipt.image = UIImage(systemName: "photo")
        imageReceipt.contentMode = .scaleToFill
        imageReceipt.clipsToBounds = true
        imageReceipt.layer.cornerRadius = 10
        imageReceipt.tintColor = .black
        imageReceipt.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageReceipt)
    }

    
    func setupName(){
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(name)
    }
    
    func setupEmail(){
        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
    }
    
    func setupPhone(){
        phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phone)
    }
    
    func setupAddressStaticLabel(){
        addressStaticLabel = UILabel()
        addressStaticLabel.translatesAutoresizingMaskIntoConstraints = false
        addressStaticLabel.text = "Address:"
        addressStaticLabel.font =  UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(addressStaticLabel)
    }
    
    func setupAddress(){
        address = UILabel()
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
    }
    
    func setupCity(){
        city = UILabel()
        city.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(city)
    }
    
    func setupZipCode(){
        zip = UILabel()
        zip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zip)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            imageReceipt.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageReceipt.heightAnchor.constraint(equalToConstant: 80),
            imageReceipt.widthAnchor.constraint(equalToConstant: 80),
            imageReceipt.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            name.topAnchor.constraint(equalTo: imageReceipt.bottomAnchor, constant: 16),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 12),
            phone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            addressStaticLabel.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 20),
            addressStaticLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            address.topAnchor.constraint(equalTo: addressStaticLabel.bottomAnchor, constant: 12),
            address.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            city.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 12),
            city.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            zip.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 12),
            zip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }

}

