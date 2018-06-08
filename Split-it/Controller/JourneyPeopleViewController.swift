//
//  JourneyPeopleViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/8/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class JourneyPeopleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier : String = "cell"
    var items : [String] = [String]()
    var peopleCount : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        print("People selection value: \(peopleCount)")
        itemsArrayInitialization()
        print(items)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PeopleCollectionViewCell
        
        cell.backgroundColor = UIColor.cyan
        cell.myLabel.text = items[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    func itemsArrayInitialization () {
        for index in 1...peopleCount {
            items.append(String(index))
        }
    }

}
