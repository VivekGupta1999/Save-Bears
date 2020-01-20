//
//  detailTableViewCell.swift
//  assignment1
//
//  Created by Vivek Gupta on 2019-10-13.
//  Copyright © 2019 Vivek Gupta. All rights reserved.
//

import UIKit

class detailTableViewCell: UITableViewCell {

    
    
    let genderLabel = UILabel()
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let emailLabel = UILabel()
    let phonenumberLabel = UILabel()
    let ageLabel = UILabel()
    let dobLabel = UILabel()
    let myImageView = UIImageView()
    let imageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        nameLabel.textColor = .black
        nameLabel.backgroundColor = .clear
        
        imageLabel.textAlignment = .left
        imageLabel.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        imageLabel.textColor = .black
        imageLabel.backgroundColor = .clear
        
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        emailLabel.backgroundColor = .clear
        emailLabel.textColor = .blue
        
        addressLabel.textAlignment = .left
        addressLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        addressLabel.backgroundColor = .clear
        addressLabel.textColor = .blue
        
        ageLabel.textAlignment = .left
        ageLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        ageLabel.backgroundColor = .clear
        ageLabel.textColor = .blue
        
        phonenumberLabel.textAlignment = .left
        phonenumberLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        phonenumberLabel.backgroundColor = .clear
        phonenumberLabel.textColor = .blue
        
        dobLabel.textAlignment = .left
         dobLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
         dobLabel.backgroundColor = .clear
         dobLabel.textColor = .blue
        
        genderLabel.textAlignment = .left
        genderLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        genderLabel.backgroundColor = .clear
        genderLabel.textColor = .blue
        
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        emailLabel.backgroundColor = .clear
        emailLabel.textColor = .blue
        
        
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(addressLabel)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(genderLabel)
       
        contentView.addSubview(phonenumberLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(dobLabel)

        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        nameLabel.frame = CGRect(x: 0, y: 5, width: 100, height: 20)
        emailLabel.frame = CGRect(x: 460, y: 5, width: 460, height: 20)
        addressLabel.frame = CGRect(x: 102, y: 5, width: 460, height: 20)
        ageLabel.frame = CGRect(x: 300, y: 5, width: 460, height: 20)
        phonenumberLabel.frame = CGRect(x: 102, y: 30, width: 460, height: 20)
        dobLabel.frame = CGRect(x: 300, y: 30, width: 460, height: 20)
        emailLabel.frame = CGRect(x: 102, y: 50, width: 400, height: 20)
        genderLabel.frame = CGRect(x: 250, y: 50, width: 460, height: 20)
        myImageView.frame = CGRect(x: 0, y: 30, width: 100, height: 50)
       
    
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
