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
var bmiHistory : [BMIValue]?

}

extension User {
    static func getUser(dict:[String: Any])-> User {
     let user = User()
         user.name = dict["name"] as? String
         user.email = dict["email"] as? String
         user.phone = dict["phone"] as? String
         user.gender = dict["gender"] as? String
        
        let gottenDataString = dict["bmiHistory"] as? String
        
        let gottenData = gottenDataString?.data(using: .utf8) ?? Data()
        
        let userBmiHistory = try? JSONDecoder().decode([BMIValue].self, from: gottenData)
        
        user.bmiHistory = userBmiHistory
        
        return user
    }
    
    static func addHis(record:[String]) -> [String: Any] {
       
        let newUser = ["his":record
                    ] as [String : Any]
        
        return newUser
    }
    static func CreateUser(name:String,email:String,phone:String,gender:String, bmiHistory:[BMIValue]) -> [String: Any] {
       
        let jsonStringData = try? JSONEncoder().encode(bmiHistory.self)
        let jsonString = String(data: jsonStringData!, encoding: .utf8) ?? ""
        
        let newUser = [
                       "name":name,
                       "email" :email,"phone":phone,"gender":gender, "bmiHistory": jsonString
                    ] as [String : Any]
        
        return newUser
    }
   
}
