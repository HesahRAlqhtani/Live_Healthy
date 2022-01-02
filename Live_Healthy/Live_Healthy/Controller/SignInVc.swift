//
//  SignInVc.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 07/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignInVc: UIViewController {

    @IBOutlet weak var emaill: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        if Auth.auth().currentUser != nil {
//            performSegue(withIdentifier: "toHome", sender: nil)
//        }
    }
    @IBAction func sginInButton(_ sender: UIButton) {
      validateFileds()
    }
    @IBAction func createNewAccount(_ sender: Any) {
      performSegue(withIdentifier: "signUp", sender: nil)
    }
    func validateFileds(){
      if emaill.text?.isEmpty == true{
        print("No userNameText")
        return
      }
      if password.text?.isEmpty == true{
        print("No Password Text")
        return
      }
      login()
      }
    func login(){
      Auth.auth().signIn(withEmail: emaill.text!, password: password.text!) { [weak self]authResult, err in
        if let error = err {
            let alert = UIAlertController(title: "Error", message:"Sorry , we could not find your account." , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
            self?.present(alert, animated : true)
           }else {
               self?.performSegue(withIdentifier: "toHome", sender: nil)

               }

          }
      }
}


    func checkUserInfo(){
      if Auth.auth().currentUser != nil {
        print(Auth.auth().currentUser?.uid)
        }
}
    
    
    
    
    
    
    
    
    

