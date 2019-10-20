//
//  MapSearchView.swift
//  TestApp
//
//  Created by Kaushal Deo on 10/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit

class MapSearchView: UIView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var layoutConstraint: NSLayoutConstraint!
    
    
    //MARK: View life cycles
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        var height: CGFloat = self.searchBar.height
        if let window = UIApplication.shared.keyWindow {
            height += window.safeAreaInsets.bottom
        }
        self.update(height: height)
    }
    
    func update(height: CGFloat, duration: TimeInterval = 0) {
        UIView.animate(withDuration: duration) {
            self.layoutConstraint.constant = height
        }
    }
}
