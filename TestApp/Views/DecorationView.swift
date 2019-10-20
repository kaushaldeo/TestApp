//
//  DecorationView.swift
//  TestApp
//
//  Created by Kaushal Deo on 8/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit

class DecorationView: UICollectionReusableView {
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        self.backgroundColor = .white
    }
    
    var cornerRadius: CGFloat = 5.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.layer.cornerRadius = self.cornerRadius
        //self.layer.masksToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect.insetBy(dx: self.cornerRadius, dy: self.cornerRadius))
        UIColor.lightGray.setFill()
        path.fill()
    }
}
