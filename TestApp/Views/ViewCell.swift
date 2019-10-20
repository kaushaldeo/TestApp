//
//  ViewCell.swift
//  TestApp
//
//  Created by Kaushal Deo on 8/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit


protocol ViewCell {
    static var cellIdentifier: String { get }
}

extension UITableView {
    func dequeueReusableCell<T: ViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.cellIdentifier, for: indexPath) as! T
    }
}

extension ViewCell where Self: UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ViewCell { }


typealias TableViewCellType = UITableViewCell.Type

//MARK: - CollectionView extension
extension UICollectionView {
    func dequeueReusableCell<T: ViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.cellIdentifier, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderView<T: ViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
        guard let view = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.cellIdentifier, for: indexPath) as? T else {
            fatalError("Error while creating headerView")
        }
        return view
    }
}


extension ViewCell where Self: UICollectionReusableView {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ViewCell {}

typealias CollectionViewCellType = CollectionViewCell.Type

class CollectionViewCell: UICollectionViewCell {

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutAttributes.size.height = self.contentView.systemLayoutSizeFitting(layoutAttributes.size, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        return layoutAttributes
    }

}


extension UIView {
    
    ///width of UIView
    var width: CGFloat {
        return self.bounds.width
    }
    
    ///height of UIView
    var height: CGFloat {
        return self.bounds.height
    }
    
    func make(corner: CGFloat) {
        self.layer.cornerRadius = corner
        self.layer.masksToBounds = true
    }
    
}
