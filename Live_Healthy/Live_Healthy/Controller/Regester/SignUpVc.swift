//
//  SignUpVc.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 08/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpVc: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var newPass: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var gender: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func register(_ sender: UIButton) {
        if name.text?.isEmpty == true {
            print("No text in user name field".loclaized)
            return
        }
        if email.text?.isEmpty == true {
            print("No text in email field".loclaized)
            return
        }
        if newPass.text?.isEmpty == true {
            print("No text in password field".loclaized)
            return
        }
        
        signUp()
        
    }
    
    
    func signUp(){
        if let email = email.text , let password = newPass.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult,error) in
                
                
                if let error = error {
                    
                    print(error.localizedDescription)
                    
                } else {
                    
                    UserApi.addUser(name: self.name.text ?? "", uid: authResult?.user.uid ?? "", email: self.email.text ?? "",phone: self.phone.text ?? "",gender: self.gender.text ?? "", bmiHistory: [BMIValue](), completion:{check in
                        if check {
                            print("Done Saving In Database")
                            self.performSegue(withIdentifier: "toHome", sender: nil)
                        }
                    })
                    
                }
                
                
                
            }
            
            
        }
        
        
    }
}
