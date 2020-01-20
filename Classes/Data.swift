//
//  Data.swift
//  assignment1
//
//  Created by Vivek Gupta on 2019-10-24.
//  Copyright © 2019 Vivek Gupta. All rights reserved.
//


import UIKit

class Data: NSObject {
    var id : Int?
    var name : String?
    var email : String?
    var address : String?
    var phonenumber : String?
    var age : String?
    var dob : String?
    var image : String?
    var gender : String?
    
    func initWithData(theRow i : Int, theImage av : String, theName n : String, theAddress a : String,thePhoneNumber no : String?, theEmail e : String,   theAge ag : String, theGender g : String,theDOB d : String )
    {
        id = i
        name = n
        email = e
        address = a
        phonenumber = no
        age = ag
        dob = d
        image = av
        gender = g
    }
    
}
