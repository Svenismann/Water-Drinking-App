//
//  ViewController.swift
//  WaterDrinkingApp
//
//  Created by Sven Forstner on 27.04.16.
//  Copyright © 2016 Sven Forstner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //var glassesToDrink: Int = Int(SharingManager.sharedInstance.numberOfGlassesToDrink)!
    
        
    
    @IBOutlet weak var remainingGlassesLabel: UILabel!
    
    
    @IBAction func decrementRemainingClasses(sender: UIButton) {
        
        //glassesToDrink -= 1
        //remainingGlassesLabel.text = "\(glassesToDrink)"
        //print(glassesToDrink)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isAppAlreadyLaunchedOnce()
                
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
       // remainingGlassesLabel.text = "\(glassesToDrink)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        //dispatch_async(dispatch_get_main_queue(), {self.remainingGlassesLabel.text = SharingManager.sharedInstance.numberOfGlassesToDrink})
    }
    
    func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let _ = defaults.stringForKey("isAppAlreadyLaunchedOnce"){
            print("App already launched")
            return true
        }else{
            defaults.setBool(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
    


}

