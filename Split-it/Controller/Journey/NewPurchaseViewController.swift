//
//  NewPurchaseViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/14/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import SVProgressHUD
import RealmSwift

class NewPurchaseViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var amountPaidTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addNewButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sharedWithCollectionView: UICollectionView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let realm = try! Realm()
    
    var selectedGroup : GroupData?
    var groupUsers = [UserData]()
    var selectedSharedUser = [UserData]()
    var selectedSharedUserIndex = [Bool]()
    var sharedUserSelection : Int = -1
    var cellInitializationStatus : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSize(width: 375, height: 785)
        amountPaidTextField.delegate = self
        titleTextField.delegate = self
        descriptionTextView.delegate = self
        sharedWithCollectionView.delegate = self
        sharedWithCollectionView.dataSource = self
        loadUserData()
        sharedWithCollectionView.reloadData()
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
        let newPurchase = PurchaseData()

        newPurchase.amount = Double(amountPaidTextField.text!)!
        newPurchase.title = titleTextField.text!
        if descriptionTextView.hasText == true {
            newPurchase.purchaseDescription = descriptionTextView.text!
        }
        //newPurchase.purchaseDate = datePicker.date
        
        // TODO: - Declaring the parent group and users.
        
        initSelectedUserArray()
        
        do {
            try realm.write {
                realm.add(newPurchase)
            }
        } catch {
            print("Error saving context in New Purchase: \(error)")
        }
    }
    
    // MARK: - Method for Initializing selectedSharedUser array.
    func initSelectedUserArray () {
        for index in 0...(groupUsers.count - 1) {
            if selectedSharedUserIndex[index] == true {
                selectedSharedUser.append(groupUsers[index])
            }
        }
    }
    
    // MARK: - Fetch Users for collectionview.
    func loadUserData (/* with request : NSFetchRequest<User> = User.fetchRequest()*/) {
        // TODO: - Fetching the userdata.
        
//        do {
//            groupUsers = try context.fetch(request)
//            selectedSharedUserIndex = [Bool](repeating: true, count: groupUsers.count)
//        } catch {
//            print("Error in fetching user data in purchase detail: \(error)")
//        }
    }
    
    // MARK: - UICollectionView Protocol methods.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewPurchaseGroupUserCell", for: indexPath) as! NewPurchaseCollectionViewCell
        cell.NameLabel.text = groupUsers[indexPath.item].userName
        cell.initialNameLabel.text = String((groupUsers[indexPath.item].userName.prefix(1)).uppercased())
        return cell
    }
    
    // MARK: - UICollectionView Apperance Method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 46, height: 66)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    // MARK: - User clicked the collectionview method.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("CollectionView Clicked at: \(indexPath.item)")
        // test
        sharedUserSelection = indexPath.item
        
        let currentCell = collectionView.cellForItem(at: indexPath) as! NewPurchaseCollectionViewCell
        if currentCell.selectedIconImageView.isHidden == true {
            currentCell.selectedIconImageView.isHidden = false
            currentCell.isSelected = true
            selectedSharedUserIndex[indexPath.item] = false
        }
        else {
            currentCell.selectedIconImageView.isHidden = true
            currentCell.isSelected = false
            selectedSharedUserIndex[indexPath.item] = true
        }
    }
    
    

}
