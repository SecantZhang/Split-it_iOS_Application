//
//  DetailTableViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/19/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import CoreData

class DetailTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var users = [User]()
    var selectedGroup : Group? {
        didSet {
            loadUserData()
        }
    }
    var groupName : String = "Detail"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = groupName
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadUserData (with request : NSFetchRequest<User> = User.fetchRequest()) {
        let predicate = NSPredicate(format: "userParentGroup.groupName MATCHES %@", selectedGroup!.groupName!)
        request.predicate = predicate
        
        do {
            users = try context.fetch(request)
        } catch {
            print("Error fetching user data from context: \(error)")
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        cell.textLabel?.text = self.users[indexPath.row].name
        return cell
    }
}
