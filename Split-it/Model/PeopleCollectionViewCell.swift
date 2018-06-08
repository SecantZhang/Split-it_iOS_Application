//
//  PeopleCollectionViewCell.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/8/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func castShadow() {
        myLabel.layer.shadowRadius = 10
        myLabel.layer.shadowOffset = CGSize(width: 10, height: 10)
        myLabel.layer.shadowOpacity = 0.5
        myLabel.layer.shadowColor = UIColor.black.cgColor
        
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowColor = UIColor.black.cgColor
    }
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setCircularImageView()
    }
    
    func setCircularImageView() {
        self.imageView.layer.cornerRadius = CGFloat(roundf(Float(self.imageView.frame.size.width / 2.0)))
    }
    
}
