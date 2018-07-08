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
    @IBOutlet weak var NewButton: UIBarButtonItem!
    @IBOutlet weak var Navigation: UINavigationItem!
    
    var selectedGroup : GroupData?
    var groupName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Navigation.title = groupName
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
            NewButton.title = "New Purchase"
            break
        case 1:
            UserViewContainer.isHidden = false
            PurchaseViewContainer.isHidden = true
            NewButton.title = "New User"
            break
        default: break
        }
        
    }
    
    @IBAction func NewButtonPressed(_ sender: Any) {
        if NewButton.title == "New Purchase" {
            performSegue(withIdentifier: "NewPurchaseSegue", sender: self)
        }
        else {
            performSegue(withIdentifier: "NewUserPopupSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailUserSegue" {
            let destinationVC = segue.destination as! DetailUserViewController
            destinationVC.selectedGroup = self.selectedGroup
        }
        else if segue.identifier == "NewPurchaseSegue" {
            let destinationVC = segue.destination as! NewPurchaseViewController
            destinationVC.selectedGroup = self.selectedGroup
        }
        else if segue.identifier == "DetailPurchaseSegue" {
            let destinationVC = segue.destination as! DetailPurchaseViewController
            destinationVC.selectedGroup = self.selectedGroup
        }
        else if segue.identifier == "NewUserPopupSegue" {
            let destinationVC = segue.destination as! AddPeoplePopupViewController
            destinationVC.currentGroup = self.selectedGroup
        }
    }
    
}
