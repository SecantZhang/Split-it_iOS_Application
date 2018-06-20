//
//  NewPurchaseViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/14/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import CoreData

class NewPurchaseViewController: UIViewController {

    @IBOutlet weak var amountPaidTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addNewButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSize(width: 375, height: 785)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func completeButtonPressed(_ sender: Any) {
        if checkCompletionStatus() == false {
            let alert = UIAlertController(title: "Please Enter the Name", message: "It is recommended to enter the amount and title before complete, ^_^", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            
        }
        
        print(checkCompletionStatus())
    }
    
    func checkCompletionStatus () -> Bool {
        var status : Bool = true
        if amountPaidTextField.text! == "" || titleTextField.text! == "" {
            status = false
        }
        
        // test
        print(amountPaidTextField)
        print(titleTextField)
        
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
        
        do {
            try context.save()
        } catch {
            print("Error saving context in New Purchase: \(error)")
        }
    }
    

}
