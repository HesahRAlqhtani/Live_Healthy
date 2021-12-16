//
//  BmiApi.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 15/12/2021.
//

import Foundation
import FirebaseFirestore
import UIKit
import Firebase


class BmiApi {
   
        
    static func addBmi(bmiResult:String,uid:String,date:String, completion: @escaping (Bool) -> Void) {
            
            let refUsers1 = Firestore.firestore().collection("BmiHistory")
        refUsers1.document(uid).setData(BmiHistory.CreateUser(bmiResult: bmiResult, date: date))
     
            completion(true)
            
        }
        static func getBmi(uid:String,completion: @escaping () -> Void) {
           
            let refUsers1 = Firestore.firestore().collection("BmiHistory")
            
            refUsers1.document(uid).getDocument { document, error in
                if let document = document,document.exists {
                    let userB = BmiHistory.getUser(dict: document.data()!)
                   completion()
                    
          
                }
            }
            
        }
    }
