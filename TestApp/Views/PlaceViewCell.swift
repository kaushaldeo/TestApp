//
//  PlaceViewCell.swift
//  TestApp
//
//  Created by Kaushal Deo on 8/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit

class PlaceViewCell: CollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.nameLabel.text = Lorem.words(3...5)
        self.addressLabel.text = Lorem.sentences(1)
        
        let view: UIView = .init()
        view.backgroundColor = UIColor(white: 0.80, alpha: 0.6)
        self.selectedBackgroundView = view
    }
}


class ActionViewCell: CollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let view: UIView = .init()
        view.backgroundColor = UIColor(white: 0.80, alpha: 0.6)
        self.selectedBackgroundView = view
    }
}


