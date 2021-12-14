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

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var newPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func register(_ sender: UIButton) {
        if userName.text?.isEmpty == true {
            print("No text in user name field")
            return
        }
        if newEmail.text?.isEmpty == true {
            print("No text in email field")
            return
    }
        if newPass.text?.isEmpty == true {
            print("No text in password field")
            return
        }
        
        signUp()
        self.performSegue(withIdentifier: "ToHome", sender: nil)
    }
    
    
    func signUp(){
        if let email = newEmail.text , let password = newPass.text{
        Auth.auth().createUser(withEmail: email, password: password) {(authResult,error) in

            UserApi.addUser(name: self.userName.text ?? "", uid: authResult?.user.uid ?? "", email: self.newEmail.text ?? "", completion:{check in
                if check {
                    print("Done Saving In Database")
                }
            })
            
         
       }
                
        
    }


}
}
