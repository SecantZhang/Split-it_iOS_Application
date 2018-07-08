//
//  AddPeoplePopupViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/9/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import RealmSwift

protocol PopupPassingDataProtocol {
    func dataReceived(enteredName : String)
}

class AddPeoplePopupViewController: UIViewController {
    
    let realm = try! Realm()

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nameEnterTextfield: UITextField!
    @IBOutlet weak var closeButton: UIButton!
    
    var dataSendDelegate : PopupPassingDataProtocol?
    var currentGroup : GroupData?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInitialization()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        dataSendDelegate?.dataReceived(enteredName: nameEnterTextfield.text!)
        if nameEnterTextfield.text != nil {
            saveUserData()
            self.dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Please Enter the Name", message: "It is recommended to enter the name  before continue, ^_^", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Initialize UI: Apperance and Label change.
    func uiInitialization () {
        headerLabel.text = "Add People"
    }
    
    func saveUserData () {
        
        let newUser = UserData()
        
        newUser.userName = nameEnterTextfield.text!
        newUser.userCreateDate = NSDate()
        
        do {
            try realm.write {
                realm.add(newUser)
            }
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    func getDate () -> Date {
        let date = Date()
        return date
    }
}
