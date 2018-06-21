//
//  DetailUserViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/20/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import CoreData

class DetailUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var users = [User]()
    var selectedGroup : Group?
    
    @IBOutlet weak var UserTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserData()
        UserTableView.delegate = self
        UserTableView.dataSource = self
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
        
        UserTableView.reloadData()
    }
    
    func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath)
        cell.textLabel?.text = self.users[indexPath.row].name
        return cell
    }
    

}
