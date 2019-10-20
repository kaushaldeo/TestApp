//
//  ButtonViewCell.swift
//  TestApp
//
//  Created by Kaushal Deo on 8/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit

class ButtonViewCell: CollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.nameLabel.text = "Find a Destination"
    }
}


class Button: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeShape()
        guard let color = self.titleColor(for: self.state) else { return }
        self.update(color: color)
    }
    
    func makeShape() {
        let color = UIColor.blue
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(color.withAlphaComponent(0.5), for: .highlighted)
        self.setTitleColor(.darkGray, for: .disabled)
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
    }
    
    func update(color: UIColor) {
        self.layer.borderColor = color.cgColor
    }
    
    override var isHighlighted: Bool {
        willSet {
            let state: UIControl.State = newValue ? .highlighted : .normal
            guard let color = self.titleColor(for: state) else { return }
            self.update(color: color)
        }
    }
    
    override var isEnabled: Bool {
        willSet {
            let state: UIControl.State = newValue ? .normal : .disabled
            guard let color = self.titleColor(for: state) else { return }
            self.update(color: color)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.makeShape()
        guard let color = self.titleColor(for: self.state) else { return }
        self.update(color: color)
    }
}
