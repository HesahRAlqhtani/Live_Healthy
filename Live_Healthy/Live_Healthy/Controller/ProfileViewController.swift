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
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var profile : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserApi.getUser(uid:Auth.auth().currentUser?.uid ?? "") { profile in
            self.profile = profile
            self.userName.text = profile.name
            self.email.text = profile.email

        }

        if Auth.auth().currentUser?.uid == nil {

        }else{

            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
