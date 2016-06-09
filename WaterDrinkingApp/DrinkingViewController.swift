//
//  DrinkingViewController.swift
//  WaterDrinkingApp
//
//  Created by Sven Forstner on 15.05.16.
//  Copyright © 2016 Sven Forstner. All rights reserved.
//

import UIKit

class DrinkingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var drinkingValueLabel: UITextField!
    
    @IBOutlet weak var numberOfGlassesLabel: UILabel!
    
    
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    var pickerView = UIPickerView()
    
    var mlOfWater = ["100", "150", "200", "250", "300", "350", "400", "450", "500", "550", "600"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPickerView()
        checkForUserDefaults()

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mlOfWater.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mlOfWater[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        drinkingValueLabel.text = mlOfWater[row]
        SharingManager.sharedInstance.cupsNeededPerDay = drinkingValueLabel.text!
        userDefaults.setObject(drinkingValueLabel.text, forKey: "userCups")
        
        let waterModel = WaterCalculationModel()
        SharingManager.sharedInstance.cupsNeededPerDay = waterModel.cupsNeededValue
        print(SharingManager.sharedInstance.cupsNeededPerDay)
        numberOfGlassesLabel.text = SharingManager.sharedInstance.cupsNeededPerDay
        
        pickerView.hidden = true 
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        pickerView.hidden = false
        
        return false
    }

    
    func addPickerView() {
        pickerView.hidden = true
        pickerView.dataSource = self
        pickerView.delegate = self
        drinkingValueLabel.delegate = self
        self.view.addSubview(pickerView)
        self.drinkingValueLabel.inputView = self.pickerView
        
        
    }
    
    func checkForUserDefaults() {
        if (NSUserDefaults.standardUserDefaults().objectForKey("userCups") != nil) {
            drinkingValueLabel.text = userDefaults.objectForKey("userCups") as? String
        } else {
            drinkingValueLabel.text = ""
        }
    }
    

    @IBAction func closeViewController(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
}
