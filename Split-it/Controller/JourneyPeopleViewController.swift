//
//  JourneyPeopleViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/8/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class JourneyPeopleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, PopupPassingDataProtocol {
    
    // conform to PopupPassingDataProtocol
    func dataReceived(enteredName : String) {
        name = enteredName
        initialName[clickedCellItem] = getFirstChar(str: name!)
        items[clickedCellItem] = enteredName
        collectionView.reloadData()
    }
    
    
    let reuseIdentifier : String = "cell"
    var items : [String] = [String]()
    var initialName : [String] = [String]()
    var peopleCount : Int = 0
    var clickedCellItem : Int = -1
    var name : String?

    @IBOutlet weak var viewContainer: UIView!    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("People selection value: \(peopleCount)")
        itemsArrayInitialization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsArrayInitialization () {
        for index in 1...peopleCount {
            items.append("User: \(index)")
            initialName.append("")
        }
    }
    
    // MARK: - Get first char of String.
    func getFirstChar (str : String) -> String {
        return String(str.prefix(1)).uppercased()
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
    
    // passing data and delegated related
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PassingDataToPopup" {
            let popupVC = segue.destination as! AddPeoplePopupViewController
            popupVC.cellIdFromPeople = clickedCellItem
            popupVC.dataSendDelegate = self
        }
    }

}
