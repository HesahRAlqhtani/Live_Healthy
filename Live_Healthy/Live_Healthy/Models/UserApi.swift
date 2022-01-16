//
//  UserApi.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 09/12/2021.
//

import Foundation
import FirebaseFirestore
import UIKit
import Firebase

class UserApi {
   
    static func addHis(uid:String,record:[String]) {
            
        let refUsers = Firestore.firestore().collection("Users")
        refUsers.document(uid).setData(User.addHis(record: record))
            
    }
    
    static func addUser(name:String,uid:String,email:String,phone:String,gender:String, bmiHistory: [BMIValue] , completion: @escaping (Bool) -> Void) {
            
            let refUsers = Firestore.firestore().collection("Users")
        
            
        refUsers.document(uid).setData(User.CreateUser(name: name, email: email,phone:phone,gender: gender, bmiHistory: bmiHistory ))
            
            completion(true)
            
        }
        static func getUser(uid:String,completion: @escaping (User) -> Void) {
           
            let refUsers = Firestore.firestore().collection("Users")
            
            refUsers.document(uid).getDocument { document, error in
                if let document = document, document.exists {
                    let user = User.getUser(dict: document.data()!)
                    completion(user)
                }
            }
            
        }
    }

