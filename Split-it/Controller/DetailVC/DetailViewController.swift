//
//  DetailViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/20/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var chosePurchaseUser: UISegmentedControl!
    @IBOutlet weak var UserViewContainer: UIView!
    @IBOutlet weak var PurchaseViewContainer: UIView!
    
    var selectedGroup : Group?
    var groupName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = groupName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        switch chosePurchaseUser.selectedSegmentIndex {
        case 0:
            PurchaseViewContainer.isHidden = false
            UserViewContainer.isHidden = true
            break
        case 1:
            UserViewContainer.isHidden = false
            PurchaseViewContainer.isHidden = true
            break
        default: break
        }
        
    }
    
}
