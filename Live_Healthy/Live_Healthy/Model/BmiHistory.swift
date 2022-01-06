//
//  BmiHistory.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 15/12/2021.
//

import Foundation
import UIKit

class BmiHistory {
    var bmiResult :String?
    var date: String?

}

extension BmiHistory {
    static func getUser(dict:[String: Any])-> BmiHistory {
     let userHistory = BmiHistory()
       
        userHistory.bmiResult = dict["bmiResult"] as? String
        userHistory.date = dict["date"] as? String
        return userHistory
    }
    static func CreateUser(bmiResult:String , date:String ) -> [String: Any] {
       
        let newUser1 = [
                      
                       "bmiResult" :bmiResult,
                        "date":date
                    ] as [String : Any]
        
        return newUser1
    }
}
