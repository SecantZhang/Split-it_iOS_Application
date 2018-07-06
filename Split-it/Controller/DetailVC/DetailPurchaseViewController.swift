//
//  DetailPurchaseViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/20/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import CoreData

class DetailPurchaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var purchaseAry = [Purchase]()
    var selectedGroup : Group?

    @IBOutlet weak var PurchaseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPurchaseData()
        PurchaseTableView.delegate = self
        PurchaseTableView.dataSource = self
        PurchaseTableView.register(UINib(nibName: "DetailPurchaseTableViewCell", bundle: nil), forCellReuseIdentifier: "PurchaseCell")
        PurchaseTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPurchaseData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadPurchaseData (with request : NSFetchRequest<Purchase> = Purchase.fetchRequest()) {
        let predicate = NSPredicate(format: "purchaseParentGroup.groupName MATCHES %@", selectedGroup!.groupName!)
        request.predicate = predicate
        
        do {
            purchaseAry = try context.fetch(request)
        } catch {
            print("Error fetching purchase data \(error)")
        }
        
        PurchaseTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell", for: indexPath) as! DetailPurchaseTableViewCell
        cell.cellTitle.text = self.purchaseAry[indexPath.row].title
        cell.amountTextField.text = String(self.purchaseAry[indexPath.row].amount)
        //cell.dateTextField.text = DateFormat(date: self.purchaseAry[indexPath.row].purchaseDate!)
        cell.descriptionLabel.text = self.purchaseAry[indexPath.row].purchaseDescription
        return cell
    }
    
    func DateFormat (date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = dateFormatter.string(from: Date())
        let yourDate = dateFormatter.date(from: myString)
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let myStringafd = dateFormatter.string(from: yourDate!)
        return myStringafd
    }
    
    

}
