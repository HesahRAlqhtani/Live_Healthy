//
//  DataTableViewCell.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 18/12/2021.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataImage1: UIImageView!
    
    @IBOutlet weak var littlelbl: UILabel!
    
    func setupCell(photo: UIImage , name: String) {
        dataImage1.image = photo
        littlelbl.text = name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
