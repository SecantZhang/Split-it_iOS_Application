//
//  NewPurchaseCollectionViewCell.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/22/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class NewPurchaseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var initialNameLabel: UILabel!
    @IBOutlet weak var shadowImageView: UIImageView!
    @IBOutlet weak var selectedIconImageView: UIImageView!
    
    var selectedStatus : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ImageView.layer.masksToBounds = true
        self.shadowImageView.layer.masksToBounds = true
        self.selectedIconImageView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setCircularImageView()
    }
    
    func setCircularImageView() {
        self.ImageView.layer.cornerRadius = CGFloat(roundf(Float(self.ImageView.frame.size.width / 2.0)))
        self.shadowImageView.layer.cornerRadius = CGFloat(roundf(Float(self.ImageView.frame.size.width / 2.0)))
        self.selectedIconImageView.layer.cornerRadius = CGFloat(roundf(Float(self.selectedIconImageView.frame.size.width / 2.0)))
    }
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }

}
