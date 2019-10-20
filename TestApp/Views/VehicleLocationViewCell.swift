//
//  VehicleLocationViewCell.swift
//  TestApp
//
//  Created by Kaushal Deo on 10/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit

class VehicleLocationViewCell: CollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var directionButton: Button!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let render = UIGraphicsImageRenderer(size: .init(width: 320, height: 160))
        self.imageView.image = render.image(actions: { (context) in
            UIColor.groupTableViewBackground.setFill()
            context.fill(context.format.bounds)
        })
        self.addressLabel.text = "309 N Pastoria Ave\nSunnyvale, CA"
    }
    
}



