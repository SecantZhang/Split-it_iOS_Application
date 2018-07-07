//
//  GroupData.swift
//  Split-it
//
//  Created by Wilson Zhang on 7/7/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import Foundation
import RealmSwift

class GroupData : Object {
    @objc dynamic var groupName : String = ""
    @objc dynamic var groupNumOfUser : Int = 0
    @objc dynamic var groupCreateDate : NSDate = NSDate()
    @objc dynamic var groupStatus : Bool = true
    
    // MARK: - Relationships
    let GroupUsers = List<UserData>()
    let GroupPurchases = List<PurchaseData>()
    
}
