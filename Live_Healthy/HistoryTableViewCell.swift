//
//  HistoryTableViewCell.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 16/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var bmiTxtField: UITextField!
    
    @IBOutlet weak var historyTxtField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func BmiBrogress() {
        BmiApi.getBmi(uid: <#T##String#>, completion: <#T##() -> Void#>)
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
