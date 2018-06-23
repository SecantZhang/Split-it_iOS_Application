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
        UserTableView.register(UINib(nibName: "UserCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUserData()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCustomTableViewCell
        cell.UserNameLabel.text = self.users[indexPath.row].name?.uppercased()
        
        return cell
    }
    

}
