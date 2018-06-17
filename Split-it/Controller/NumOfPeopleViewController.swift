//
//  NumOfPeopleViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/7/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class NumOfPeopleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    // picker data array
    var pickerData : [String] = [String]()
    var selection : Int = 1
    
    @IBOutlet weak var viewPiece: UIView!
    @IBOutlet weak var numberPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var groupNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // changeApperance()
        
        // Connect Data (Picker)
        self.numberPicker.delegate = self
        self.numberPicker.dataSource = self
        self.groupNameTextField.delegate = self
        
        // Implement the data array for picker
        pickerData = ["1", "2", "3", "4", "5", "6", "7", "8"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - method for dismissing the keyboard when user click the "return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MARK: - method when next button is pressed
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        print("Preparation number: \(selection)")
        //performSegue(withIdentifier: "SendData_PreparationToPeople", sender: self)
    }
    
    func changeApperance () {
        // cast shadow
        viewPiece.layer.shadowColor = UIColor.black.cgColor
        viewPiece.layer.shadowOpacity = 0.5
        viewPiece.layer.shadowOffset = CGSize.zero
        viewPiece.layer.shadowRadius = 10
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // MARK: - Detecting the picker selection.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = row + 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendData_PreparationToPeople" {
            let peopleVC = segue.destination as! JourneyPeopleViewController
            peopleVC.peopleCount = selection
            peopleVC.groupName = groupNameTextField.text == nil ? "Journey" : groupNameTextField.text!
        }
    }
}
