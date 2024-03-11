//
//  UITableViewCell.swift
//  ContactList
//
//  Created by Gagana Ananda on 3/11/24.
//


import UIKit

class TableViewContactCell: UITableViewCell {
    var wrapperCellView: UIView!
    
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var imageReceipt: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setupWrapperCellView()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        setupimageReceipt()
        initConstraints()

    }
    
    func setupimageReceipt(){
        imageReceipt = UIImageView()
        imageReceipt.image = UIImage(systemName: "photo")
        imageReceipt.contentMode = .scaleToFill
        imageReceipt.clipsToBounds = true
        imageReceipt.layer.cornerRadius = 10
        imageReceipt.translatesAutoresizingMaskIntoConstraints = false
        imageReceipt.tintColor = .black
        wrapperCellView.addSubview(imageReceipt)
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 10.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 6.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.font = UIFont.boldSystemFont(ofSize: 20) // Adjust the font size as needed
        wrapperCellView.addSubview(labelName)
    }

    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhone)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            labelName.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant: 8),
            labelName.heightAnchor.constraint(equalToConstant: 32),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelEmail.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant: 8),
            labelEmail.heightAnchor.constraint(equalToConstant: 32),
            labelEmail.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
            labelPhone.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant: 8),
            labelPhone.heightAnchor.constraint(equalToConstant: 32),
            labelPhone.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            imageReceipt.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imageReceipt.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            //MARK: it is better to set the height and width of an ImageView with constraints...
            imageReceipt.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            imageReceipt.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
