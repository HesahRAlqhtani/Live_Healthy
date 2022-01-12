//
//  ProfileViewController.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 15/12/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    
    var profile : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserApi.getUser(uid:Auth.auth().currentUser?.uid ?? "") { profile in
            self.profile = profile
            self.name.text = profile.name
            self.email.text = profile.email
            self.phone.text = profile.phone
            self.gender.text = profile.gender

        }

        if Auth.auth().currentUser?.uid == nil {

        }else{

            
        }
        
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            self.dismiss(animated: true, completion: nil)
        }catch let sinOutError as NSError {
            print("ERROR Signing Out: %@" ,sinOutError)
        }
    }
    
   
}
