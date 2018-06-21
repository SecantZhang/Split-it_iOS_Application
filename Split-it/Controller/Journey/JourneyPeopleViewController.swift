//
//  JourneyPeopleViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/8/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import CoreData

class JourneyPeopleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, PopupPassingDataProtocol {
    
    // conform to PopupPassingDataProtocol
    func dataReceived(enteredName : String) {
        name = enteredName
        initialName[clickedCellItem] = getFirstChar(str: name!)
        items[clickedCellItem] = enteredName
        itemStatus[clickedCellItem] = true
        collectionView.reloadData()
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let reuseIdentifier : String = "cell"
    var groupName : String = ""
    var items : [String] = [String]()
    var itemStatus : [Bool] = [Bool]()
    var initialName : [String] = [String]()
    var peopleCount : Int = 0
    var clickedCellItem : Int = -1
    var name : String?
    var currentGroup : Group?

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var groupNameTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupNameTextView.text = groupName
        print("People selection value: \(peopleCount)")
        itemsArrayInitialization()
        print(groupName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsArrayInitialization () {
        for index in 1...peopleCount {
            items.append("User: \(index)")
            initialName.append("")
            itemStatus.append(false)
        }
    }
    
    // MARK: - Get first char of String.
    func getFirstChar (str : String) -> String {
        return String(str.prefix(1)).uppercased()
    }
    
    // passing data and delegated related
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PassingDataToPopup" {
            let popupVC = segue.destination as! AddPeoplePopupViewController
            popupVC.dataSendDelegate = self
            popupVC.currentGroup = self.currentGroup
        }
        else if segue.identifier == "PeopleToDetailSegue" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedGroup = self.currentGroup
            destinationVC.groupName = self.currentGroup?.groupName
        }
    }
    
    // TODO: - Save Function.
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        // check if adding people process is completed.
        var status = true
        for index in 0...peopleCount-1 {
            if itemStatus[index] == false {
                status = false
                break
            }
        }
        if status == false {
            let alert = UIAlertController(title: "Please Complete the Adding Process", message: "It is recommended to add all people before continue, ^_^", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            
        }
    }
    
    /*******************************************
        Collection view manipulation
     *******************************************/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PeopleCollectionViewCell
        
        cell.myLabel.text = items[indexPath.item]
        cell.initialNameLabel.text = initialName[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        clickedCellItem = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
}
