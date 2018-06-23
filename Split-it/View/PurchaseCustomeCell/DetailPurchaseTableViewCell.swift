//
//  DetailPurchaseTableViewCell.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/21/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class DetailPurchaseTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var amountTextField: UILabel!
    @IBOutlet weak var dateTextField: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
