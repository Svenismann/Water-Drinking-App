//
//  WaterCalculationModel.swift
//  WaterDrinkingApp
//
//  Created by sven forstner on 07.05.16.
//  Copyright © 2016 Sven Forstner. All rights reserved.
//

import Foundation

class WaterCalculationModel {
    
    var age:Int? = Int(SharingManager.sharedInstance.age)
    var weight:Int? = Int(SharingManager.sharedInstance.weight)
    var activity = SharingManager.sharedInstance.activity
    var cupsOfWaterToDrink:Int? = Int(SharingManager.sharedInstance.cupsNeededPerDay)

    
    var waterPerKilo: Int {
        
        var waterNeededPerKilo = Int()
        
        if age > 19 {
           waterNeededPerKilo = 35
        } else {
            waterNeededPerKilo = 40
        }
        return waterNeededPerKilo
    }
    
    var activityValue: Int {
        
        var value = Int()
        
        if activity == "Sitzend" {
            value = 0
        } else if activity == "Normal" {
            value = 100
        } else if activity == "Sportlich" {
            value = 200
        }
        
        return value
    }

    
    func calculate() -> Int {
        return weight! * waterPerKilo + activityValue
    }
    
    func calculateCups() -> Int {
        return calculate() / cupsOfWaterToDrink!
    }
    
    var waterNeededValue: String {
        return calculate().description
    }
    
    var cupsNeededValue : String {
        return calculateCups().description
    }
    
}

