//
//  WaterPickerView.swift
//  WaterDrinkingApp
//
//  Created by sven forstner on 07.05.16.
//  Copyright © 2016 Sven Forstner. All rights reserved.
//

import Foundation
import UIKit

class WaterPickerView : UIPickerView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 190.0/255, green: 190.0/255, blue: 190.0/255, alpha: 1.0)
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
