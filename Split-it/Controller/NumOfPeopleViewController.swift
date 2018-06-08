//
//  NumOfPeopleViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/7/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class NumOfPeopleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // picker data array
    var pickerData : [String] = [String]()
    var selection : Int = 0
    
    @IBOutlet weak var viewPiece: UIView!
    @IBOutlet weak var numberPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeApperance()
        
        // Connect Data (Picker)
        self.numberPicker.delegate = self
        self.numberPicker.dataSource = self
        
        // Implement the data array for picker
        pickerData = ["1", "2", "3", "4", "5", "6", "7", "8"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - method when next button is pressed
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        print(selection)
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
}
