//
//  User.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 09/12/2021.
//

import Foundation
import UIKit

class User {
var name:String?
var email: String?
var phone:String?
var gender:String?
    

}

extension User {
    static func getUser(dict:[String: Any])-> User {
     let user = User()
         user.name = dict["name"] as? String
         user.email = dict["email"] as? String
         user.phone = dict["phone"] as? String
         user.gender = dict["gender"] as? String
        return user
    }
    static func CreateUser(name:String,email:String,phone:String,gender:String) -> [String: Any] {
       
        let newUser = [
                       "name":name,
                       "email" :email,"phone":phone,"gender":gender
                    ] as [String : Any]
        
        return newUser
    }
   
}
