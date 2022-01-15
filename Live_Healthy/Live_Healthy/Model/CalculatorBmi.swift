//
//  CalculatorBmi.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 13/12/2021.
//

import UIKit

struct CalcultorBmi {
//use if for caculate the bmi
    var bmi : BMI?
    mutating func calculateBMIResult(height : Float, weight : Float) {
     let bmiValue = (weight/(height * height))
        if bmiValue < 18.5 {
            
            bmi = BMI(value: bmiValue, advice: "YOUR BMI IS UNDERWEIGHT! ".loclaized, color:.systemGreen)
                    
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "YOUR BMI IS NORMAL AND IDEAL!".loclaized, color:.systemGreen)
                      
            
        }else{
            
            bmi = BMI(value: bmiValue, advice: "YOUR BMI IS OVERWEIGHT!".loclaized, color: UIColor .systemYellow)
        }
        
        
        
    }
    func getBmiValue() ->String {
        
        let bmiValue = String(format:"%.1f",bmi?.value ?? 0.0)
        return bmiValue
        
    }
    
    func getAdvice() ->String {
        return bmi?.advice ?? "No Advice"
    }
    func getcolor() -> UIColor {
        return bmi?.color ?? .white
    }
}
