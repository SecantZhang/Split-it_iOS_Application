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
        return peopleCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PeopleCollectionViewCell
        
        cell.backgroundColor = UIColor.cyan
        
        return cell
    }

}
