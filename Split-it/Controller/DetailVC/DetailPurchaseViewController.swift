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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseDetailCell", for: indexPath)
        cell.textLabel?.text = self.purchaseAry[indexPath.row].title
        cell.detailTextLabel?.text = String(self.purchaseAry[indexPath.row].amount)
        return cell
    }
    
    

}
