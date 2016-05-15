//
//  SettingsViewController.swift
//  WaterDrinkingApp
//
//  Created by Sven Forstner on 29.04.16.
//  Copyright © 2016 Sven Forstner. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
   
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var neededAmountOfWaterLabel: UILabel!
    
    var heightPickerView = WaterPickerView()
    var agePickerView = UIPickerView()
    var weightPickerView = UIPickerView()
   
    var ageData = Array(15...100)
    var weightData = Array(40...150)
    var activityData = ["Normal", "Sitzend", "Sportlich"]
    
    var clear = ""
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPickerView()
        checkForUserDefaults()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // PickerView Setup
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if  pickerView.tag == 0 {
            return ageData.count
        } else if pickerView.tag == 1 {
            return weightData.count
        } else if pickerView.tag == 2 {
            return activityData.count
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        

        if pickerView.tag == 0 {
            return String(ageData[row])
        } else if pickerView.tag == 1 {
            return String(weightData[row])
        } else if pickerView.tag == 2 {
            return activityData[row]
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if pickerView.tag == 0 {
            ageTextField.text = String(ageData[row])
        } else if pickerView.tag == 1{
            weightTextField.text =  String(weightData[row])
        } else if pickerView.tag == 2 {
            activityTextField.text = activityData[row]
        }
        agePickerView.hidden = true
        weightPickerView.hidden = true
        heightPickerView.hidden = true
        
        SharingManager.sharedInstance.age = self.ageTextField.text!
        SharingManager.sharedInstance.activity = self.activityTextField.text!
        SharingManager.sharedInstance.weight = self.weightTextField.text!
        
        if ageTextField.text?.isEmpty == false  && weightTextField.text?.isEmpty == false && activityTextField.text?.isEmpty == false {
            let waterNeeded = WaterCalculationModel()
            SharingManager.sharedInstance.waterNeededPerDay = waterNeeded.waterNeededValue
            print(SharingManager.sharedInstance.waterNeededPerDay)
            neededAmountOfWaterLabel.text = " Du musst \(waterNeeded.waterNeededValue) ml Wasser Trinken"
            
            userDefaults.setObject(self.ageTextField.text, forKey: "userAge")
            userDefaults.setObject(self.weightTextField.text, forKey: "userWeight")
            userDefaults.setObject(self.activityTextField.text, forKey: "userActivity")
            userDefaults.setObject(neededAmountOfWaterLabel.text, forKey: "userNeeds")

            print("kakakakka")
            
        }
      
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if textField.tag == 0 {
            agePickerView.hidden = false
        } else if textField.tag == 1 {
            weightPickerView.hidden = false
        }else if textField.tag == 2 {
            heightPickerView.hidden = false
        }
        return false
    }
    
   
    
    func addPickerView()  {
        agePickerView.delegate = self
        weightPickerView.delegate = self
        heightPickerView.delegate = self
        
        agePickerView.dataSource = self
        weightPickerView.dataSource = self
        heightPickerView.dataSource = self
        
        ageTextField.delegate = self
        weightTextField.delegate = self
        activityTextField.delegate = self
        
        agePickerView.hidden = true
        weightPickerView.hidden = true
        heightPickerView.hidden = true
        
        agePickerView.tag = 0
        weightPickerView.tag = 1
        heightPickerView.tag = 2
        
        ageTextField.tag = 0
        weightTextField.tag = 1
        activityTextField.tag = 2
        
        self.view.addSubview(heightPickerView)
        self.view.addSubview(agePickerView)
        self.view.addSubview(weightPickerView)
        
        self.ageTextField.inputView = self.agePickerView
        self.weightTextField.inputView = self.weightPickerView
        self.activityTextField.inputView = self.heightPickerView
    }
    
    func checkForUserDefaults(){
        if (NSUserDefaults.standardUserDefaults().objectForKey("userAge") != nil) {
            ageTextField.text = userDefaults.objectForKey("userAge") as? String
        } else {
            ageTextField.text = ""
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("userWeight") != nil) {
            weightTextField.text = userDefaults.objectForKey("userWeight") as? String
        } else {
            weightTextField.text = ""
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("userActivity") != nil) {
            activityTextField.text = userDefaults.objectForKey("userActivity") as? String
        } else {
            activityTextField.text = ""
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("userNeeds") != nil) {
            neededAmountOfWaterLabel.text = userDefaults.objectForKey("userNeeds") as? String
        } else {
            neededAmountOfWaterLabel.text = SharingManager.sharedInstance.waterLabelText
        }
    }
    
    @IBAction func resetToDefaults(sender: UIButton) {
    
        ageTextField.text = clear
        weightTextField.text = clear
        activityTextField.text = clear
        
        neededAmountOfWaterLabel.text = SharingManager.sharedInstance.waterLabelText
        
        userDefaults.removeObjectForKey("userAge")
        userDefaults.removeObjectForKey("userWeight")
        userDefaults.removeObjectForKey("userActivity")
        userDefaults.removeObjectForKey("userNeeds")
        userDefaults.removeObjectForKey("isAppAlreadyLaunchedOnce")
        
    }
    
    @IBAction func closeViewController(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
