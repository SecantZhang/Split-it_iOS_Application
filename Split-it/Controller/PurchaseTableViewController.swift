//
//  PurchaseTableViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/13/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import CoreData

class PurchaseTableViewController: UITableViewController {
    
    // Create a Array of group objects.
    var groups = [Group]()
    // Create Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    //MARK: - TableView Datasource Methods.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    //MARK: - TableView Delegate Methods.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell", for: indexPath)
        // things you want to display in the tableview cell.
        
        return cell
    }
    
    //MARK: - Data Manipulation Methods.
    
}
