//
//  AddPeoplePopupViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/9/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class AddPeoplePopupViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
