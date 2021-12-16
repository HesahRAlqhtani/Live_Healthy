//
//  InformationBmIVc.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 13/12/2021.
//

import UIKit

class InformationBmiVc: UIViewController {

    var bmiValue : String?
    var color : UIColor?
    var advice : String?
    
    @IBOutlet weak var bmiResultLbl: UILabel!
    
    @IBOutlet weak var adviceLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResultLbl.text = bmiValue
        adviceLbl.text = advice
        view.backgroundColor = color

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reCalculatorBtn(_ sender: UIButton) {
        dismiss(animated: false, completion:nil)
        
    }
    

}
