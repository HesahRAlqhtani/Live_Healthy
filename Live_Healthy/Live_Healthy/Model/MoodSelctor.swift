//
//  MoodSelctor.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 14/12/2021.
//

import UIKit

enum Mood: String {
 case overWeight
 case normal
 case underWeight
    
}

class MoodSelctor : UIControl {
    
    private let moods : [Mood] = [.normal ,.overWeight ,.underWeight]
    var selctedMoodIndex = 0 {
        didSet {
            animateBackView()
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
    override init(frame:CGRect){
        super.init(frame: frame)
        configureViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backView.layer.cornerRadius = backView.bounds.width / 2
    }
    private func configureViews(){
        
        self.addSubview(backView)
        self.addSubview(moodStackView)
        moodStackView.translatesAutoresizingMaskIntoConstraints = false
        moodStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        moodStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        moodStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        moodStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        configureButtons()
    }
    private func configureButtons(){
        
        for mood in moods {
            
            let normalButton = UIButton()
            normalButton.translatesAutoresizingMaskIntoConstraints = false
            normalButton.setImage(UIImage(named:mood.rawValue), for: .normal)
            normalButton.imageView?.contentMode = .scaleAspectFit
            normalButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            moodStackView.addArrangedSubview(normalButton)
            
            normalButton.heightAnchor.constraint(equalTo: moodStackView.heightAnchor, constant: -50).isActive = true
            normalButton.widthAnchor.constraint(equalTo: moodStackView.heightAnchor, constant: -50).isActive = true
            normalButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        }
        backView.widthAnchor.constraint(equalTo: moodStackView.subviews.first!.widthAnchor, constant: 10).isActive = true
        backView.heightAnchor.constraint(equalTo: moodStackView.subviews.first!.heightAnchor, constant: 10).isActive = true
        backView.centerYAnchor.constraint(equalTo: moodStackView.subviews.first!.centerYAnchor).isActive = true
        backView.centerXAnchor.constraint(equalTo: moodStackView.subviews.first!.centerXAnchor).isActive = true
   
    }
    private func animateBackView(){
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.backView.transform.tx = self.moodStackView.subviews[self.selctedMoodIndex].frame.origin.x
            self.backView.backgroundColor = UIColor(named: self.moods[self.selctedMoodIndex].rawValue)},completion: nil)
        
    }
    @objc func buttonTapped(_ sender : UIButton){
        
        selctedMoodIndex = moodStackView.subviews.firstIndex(of: sender) ?? 0
        
        sendActions(for: .valueChanged)
    }

            
            
        }
        
        
        
        
        

    

