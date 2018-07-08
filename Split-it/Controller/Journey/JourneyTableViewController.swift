//
//  JourneyTableViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/19/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import CoreData

class JourneyTableViewController: UITableViewController {
    
    var groups = [GroupData]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGroupData()
        tableView.reloadData()
        tableView.register(UINib(nibName: "JourneyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadGroupData()
        tableView.reloadData()
    }
    
    func loadGroupData () {
//        let request : NSFetchRequest<Group> = Group.fetchRequest()
//
//        do {
//            try groups = context.fetch(request)
//        } catch {
//            print("Error loading groups \(error)")
//        }

    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! JourneyCustomTableViewCell
        cell.JourneyTitleLabel.text = self.groups[indexPath.row].groupName
        return cell
    }
    
    // MARK: - Swipe to delete function for table view
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
        }
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "JourneyDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JourneyDetailSegue" {
            let destinationVC = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedGroup = groups[indexPath.row]
                destinationVC.groupName = groups[indexPath.row].groupName
            }
        }
    }

  
}
