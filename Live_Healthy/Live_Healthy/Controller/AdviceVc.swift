//
//  AdviceVc.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 14/12/2021.
//

import UIKit

class AdviceVc: UIViewController {
    let moodSelctor : [MoodPage] = [
    
        MoodPage(description: "Taking a brisk walk 20-30 minutes per day will help you lose weight and keep your joints and muscles healthy.", imageName:"fat1" ),MoodPage(description: "If you are underweight, it is important to eat a variety of foods that give you the nutrition you need. You should make sure you eat enough energy to gain weight, protein to repair your body and build your muscles, and vitamins and minerals to make you healthy.", imageName:"underweght1"),MoodPage(description: "A person’s overall health is about much more than the absence of disease. It’s the state of physical, mental, and social well-being. Ultimately, it’s the key to living a productive and satisfying life", imageName: "normal")
      
    
    ]
    
    
    @IBOutlet weak var descritionLbl: UILabel!
    
    @IBOutlet weak var imageDescriotin: UIImageView!
    
    @IBOutlet weak var viewWeight: MoodSelctor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpMood()

        // Do any additional setup after loading the view.
    }
    func SetUpMood(){
        descritionLbl.text = moodSelctor[viewWeight.selctedMoodIndex].description
        descritionLbl.text = moodSelctor[viewWeight.selctedMoodIndex].description
        imageDescriotin.image = UIImage(named:moodSelctor [viewWeight.selctedMoodIndex].imageName)
            imageDescriotin.image = UIImage(named:moodSelctor [viewWeight.selctedMoodIndex].imageName)
        
        imageDescriotin.transform = imageDescriotin.transform.scaledBy(x: 2, y: 2)
        imageDescriotin.alpha = 0
       
        
        let Label1 = descritionLbl.transform
        descritionLbl.transform = descritionLbl.transform.translatedBy(x:-view.frame.width, y: 0)
        let animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeInOut){
            self .imageDescriotin.transform = self.imageDescriotin.transform.scaledBy(x: 0.5, y: 0.5)
            self.imageDescriotin.alpha = 1
            self.imageDescriotin.transform = Label1
            self.imageDescriotin.transform = .identity
            
            
        }
        animator.startAnimation()
    }


  
    @IBAction func moodChange(_ sender: Any) {
        SetUpMood()
    }
        
}
