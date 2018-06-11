//
//  AddPeoplePopupViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/9/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

protocol PopupPassingDataProtocol {
    func dataReceived(enteredName : String)
}

class AddPeoplePopupViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nameEnterTextfield: UITextField!
    @IBOutlet weak var closeButton: UIButton!
    
    var dataSendDelegate : PopupPassingDataProtocol?
    var cellIdFromPeople : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInitialization()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dataSendDelegate?.dataReceived(enteredName: nameEnterTextfield.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Initialize UI: Apperance and Label change.
    func uiInitialization () {
        headerLabel.text = "Add User: \(cellIdFromPeople! + 1)"
    }
}