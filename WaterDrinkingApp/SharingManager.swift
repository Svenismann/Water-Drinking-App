//
//  SharingManager.swift
//  WaterDrinkingApp
//
//  Created by Sven Forstner on 28.04.16.
//  Copyright © 2016 Sven Forstner. All rights reserved.
//

import Foundation


class SharingManager {
    static let sharedInstance = SharingManager()
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var waterNeededPerDay = String()
    var cupsNeededPerDay = String()
    
    var age = String()
    var weight = String()
    var activity = String()
    
    var waterLabelText = "Gib deine Werte ein!"
    
        
    
    
    
    
}