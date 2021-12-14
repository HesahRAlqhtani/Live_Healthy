//
//  MoodSelctor.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 14/12/2021.
//

import UIKit

enum Mood {
 case overWeight
 case normal
 case underWeight
    
}

class MoodSelctor : UIControl {
    
    private let moods : [Mood] = [.normal ,.overWeight ,.underWeight]
    var selctedMoodIndex = 0 {
        didSet {
            anmatedBackView()
        }
    }
    private let moodStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
        
        
    }()
    private let backView : UIView = {
     
        let newView = UIView()
        newView.backgroundColor = UIColor(named: "normal")
        return newView
        
        
    }()
    
}
