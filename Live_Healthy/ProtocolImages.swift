//
//  ProtocolImages.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 18/12/2021.
//

import Foundation
import UIKit
protocol Images {
var name : String {get}
var image : UIImage{get}
}
struct BringImages : Images {
var name: String
var image: UIImage
    
}
