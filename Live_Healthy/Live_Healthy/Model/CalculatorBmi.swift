//
//  CalculatorBmi.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 13/12/2021.
//

import UIKit
import SwiftUI
struct CalcultorBmi {

    var bmi : BMI?
    mutating func calculateBMIResult(height : Float, weight : Float){
     let bmiValue = (weight/(height * height))
        if bmiValue < 18.5 {
            
            bmi = BMI(value: bmiValue, advice: "Eat more pies!" , color:#colorLiteral(red: 0.5843137503,green:0.8235294223,blue:0.4196078479,alpha:1))
        }else if bmiValue < 24.9{
         bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red:0.5843137503,green:0.8235294223,blue:0.4196078479,alpha:1))
            
        }else{
            
            bmi = BMI(value: bmiValue, advice: "Eat fewer pies!", color: #colorLiteral(red:0.8549019694,green:0.250980407,blue:0.4784313738,alpha:1))
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
