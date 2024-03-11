//
//  Contact.swift
//  contact
//
//  Created by Gagana Ananda on 11/03/24.
//

import Foundation
import UIKit

struct Contact{
    var name : String?
    var email : String?
    var phoneType : String?
    var phoneNumber : String?
    var address : String?
    var city : String?
    var zipcode : String?
    var image: UIImage?
    init(name: String? = nil, email: String? = nil, phoneType: String? = nil, phoneNumber: String? = nil, address: String? = nil, city: String? = nil, zipcode: String? = nil, image: UIImage? = nil) {
        self.name = name
        self.email = email
        self.phoneType = phoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.city = city
        self.zipcode = zipcode
        self.image = image
        
    }
}
