//
//  PurchaseData.swift
//  Split-it
//
//  Created by Wilson Zhang on 7/7/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import Foundation
import RealmSwift

class PurchaseData: Object {
    @objc dynamic var amount : Double = 0.0
    @objc dynamic var amountAfterSplit : Double = 0.0
    @objc dynamic var purchaseDate : NSDate = NSDate()
    @objc dynamic var purchaseDescription : String = ""
    @objc dynamic var title : String = ""
    
    // MARK: - Inverse Relationship
    var parentGroup = LinkingObjects(fromType: GroupData.self, property: "GroupPurchases")
    var ContainedUser = LinkingObjects(fromType: UserData.self, property: "UserPurchases")
    
    // MARK: - Relationships
    let PurchaseUsers = List<UserData>()
}
