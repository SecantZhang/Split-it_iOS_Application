//
//  NewPurchaseViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/14/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import CoreData
import SVProgressHUD

class NewPurchaseViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var amountPaidTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addNewButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedGroup : Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSize(width: 375, height: 785)
        amountPaidTextField.delegate = self
        titleTextField.delegate = self
        descriptionTextView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func completeButtonPressed(_ sender: Any) {
        SVProgressHUD.show()
        if checkCompletionStatus() == false {
            let alert = UIAlertController(title: "Please Enter the Name", message: "It is recommended to enter the amount and title before complete, ^_^", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            saveData()
            SVProgressHUD.dismiss()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func checkCompletionStatus () -> Bool {
        var status : Bool = true
        if amountPaidTextField.text! == "" || titleTextField.text! == "" {
            status = false
        }
        return status
    }
    
    func saveData () {
        let newPurchase = Purchase(context: context)
        
        newPurchase.amount = Double(amountPaidTextField.text!)!
        newPurchase.title = titleTextField.text!
        if descriptionTextView.hasText == true {
            newPurchase.purchaseDescription = descriptionTextView.text!
        }
        newPurchase.purchaseDate = datePicker.date
        newPurchase.purchaseParentGroup = self.selectedGroup
        
        do {
            try context.save()
        } catch {
            print("Error saving context in New Purchase: \(error)")
        }
    }
    

}
