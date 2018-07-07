//
//  UserData.swift
//  Split-it
//
//  Created by Wilson Zhang on 7/7/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import Foundation
import RealmSwift

class UserData : Object {
    @objc dynamic var userCreateDate : NSDate = NSDate()
    @objc dynamic var userName : String = ""
    @objc dynamic var userAmountSpend : Double = 0.0
    
    // MARK: - Inverse Relationship
    var parentGroup = LinkingObjects(fromType: GroupData.self, property: "GroupUsers")
    var ContainedPurchase = LinkingObjects(fromType: PurchaseData.self, property: "PurchaseUsers")
    
    // MARK: - Relationships
    let UserPurchases = List<PurchaseData>()
}
