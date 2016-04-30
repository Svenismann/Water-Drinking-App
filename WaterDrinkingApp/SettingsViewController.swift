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
    
    @IBOutlet weak var neededAmountOfWaterLabel: UILabel!
    
    
    @IBOutlet weak var agePickerView: UIPickerView! = UIPickerView()
    @IBOutlet weak var weightPickerView: UIPickerView! = UIPickerView()
   
    var ageData = Array(15...100)
    
        
    
    
    var weightData = Array(40...150)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        agePickerView.delegate = self
        weightPickerView.delegate = self
        ageTextField.delegate = self
        weightTextField.delegate = self
        
        agePickerView.hidden = true
        weightPickerView.hidden = true
        
        agePickerView.tag = 1
        weightPickerView.tag = 2
        
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
        
        var ageDataStringArray = ageData.map({(number: Int) -> String in
            return String(number)})
        
        var weightDataStringArray = weightData.map({(number: Int) -> String in
            return String(number)})

        
        if  pickerView == agePickerView {
            return ageDataStringArray.count
        } else if pickerView == weightPickerView {
            return weightDataStringArray.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var ageDataStringArray = ageData.map({(number: Int) -> String in
            return String(number)})
        
        var weightDataStringArray = weightData.map({(number: Int) -> String in
            return String(number)})

        
        if pickerView == agePickerView {
            return ageDataStringArray[row]
        } else if pickerView == weightPickerView {
            return weightDataStringArray[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var ageDataStringArray = ageData.map({(number: Int) -> String in
            return String(number)})
        
        var weightDataStringArray = weightData.map({(number: Int) -> String in
            return String(number)})

        
        ageTextField.text = ageDataStringArray[row]
        agePickerView.hidden = true
        updateValue()
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        agePickerView.hidden = false
        print("started")
        return false
    }
    
    
    func updateValue(){
        //SharingManager.sharedInstance.numberOfGlassesToDrink = self.numberOfGlassesTextField.text!
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
