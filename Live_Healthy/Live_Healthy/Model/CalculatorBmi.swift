//
//  CalculatorBmi.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 13/12/2021.
//

import UIKit
struct CalcultorBmi {

    var bmi : BMI?
    mutating func calculateBMIResult(height : Float, weight : Float) {
     let bmiValue = (weight/(height * height))
        if bmiValue < 18.5 {
            
            bmi = BMI(value: bmiValue, advice: "YOUR BMI IS UNDERWEIGHT! " , color:#colorLiteral(red:0.4549019661,green:0.350980499,blue:0.2784313732,alpha:0.6))
                    
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "YOUR BMI IS NORMAL AND IDEAL!", color:#colorLiteral(red:0.1249019691,green:0.333980407,blue:0.4784313223,alpha:0.6))
            
        }else{
            
            bmi = BMI(value: bmiValue, advice: "YOUR BMI IS OVERWEIGHT!", color: #colorLiteral(red:0.223459691,green:0.250980407,blue:0.4284319891,alpha:0.6))
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
