//
//  mainHomeViewController.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 09/12/2021.
//

import UIKit
import FirebaseAuth

class mainHomeViewController: UIViewController {
   
    var calculate = CalcultorBmi()
    @IBOutlet weak var heightlbl: UILabel!
    @IBOutlet weak var weightlbl: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLbl: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    @IBAction func heightSlidBtn(_ sender: UISlider) {
        let height = (String(format: "%.2f", sender.value))
        heightlbl.text = "\(height) m"
        
        
    }
    @IBAction func weightSlidBtn(_ sender: UISlider) {
        let weight = (Int(sender.value))
        weightlbl.text = "\(weight) kg"
        
    }
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightLbl.value
        calculate.calculateBMIResult(height:height,weight:weight)
//     to save data in firebase 
        let uid = Auth.auth().currentUser?.uid ?? ""
        
        UserApi.getUser(uid: uid) { user in
            
            var userBmiHistory = user.bmiHistory
            let date = Date().formatted(date: .abbreviated, time: .standard)
            
            
            userBmiHistory?.append(BMIValue(bmi: self.calculate.getBmiValue(), date: date))
            
            UserApi.addUser(name: user.name ?? "", uid: uid, email: user.email ?? "", phone: user.phone ?? "", gender: user.gender ?? "", bmiHistory: userBmiHistory ?? [BMIValue](), completion: { success in
                
            })
            
            
        }
        
        performSegue(withIdentifier: "toResult", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let destinationVc = segue.destination as? InformationBmiVc
            destinationVc?.bmiValue = calculate.getBmiValue()
            destinationVc?.color = calculate.getcolor()
            destinationVc?.advice = calculate.getAdvice()
            destinationVc?.modalPresentationStyle = .fullScreen
            
            
        }
        
    }
    
}
