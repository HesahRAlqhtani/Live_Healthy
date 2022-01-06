//
//  SecondVC.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 02/01/2022.
//

import UIKit

class SecondVC: UIViewController {
 
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var adviceImage: UIImageView!
    @IBOutlet weak var desLabel: UILabel!
    
    var lblTitleGroup : String?
    var adviceImageGroup : UIImage?
    var desLabelGroup : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = lblTitleGroup
        adviceImage.image = adviceImageGroup
        desLabel.text = desLabelGroup
        // Do any additional setup after loading the view.
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
