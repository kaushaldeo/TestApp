//
//  DecorationViewFlowLayout.swift
//  TestApp
//
//  Created by Kaushal Deo on 8/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout

extension UICollectionView {
    var offsetContentInset: CGFloat {
        return (self.contentInset.left + self.contentInset.right)/2.0
    }
}

class DecorationViewFlowLayout: UICollectionViewFlowLayout {
    var offsetSectionInset: CGFloat {
        return (self.sectionInset.left + self.sectionInset.right)/2.0
    }
    
    static let kind = "DecorationView"
    static let separatorKinds = [DecorationViewFlowLayout.kind]
    
    var decorationViews = [Int:UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        defer {
            super.prepare()
        }
        guard let collectionView = collectionView else {
            return
        }
        self.minimumLineSpacing = 1/UIScreen.main.scale
        self.minimumInteritemSpacing = self.minimumLineSpacing
        self.decorationViews = [:]
        self.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        let width = collectionView.bounds.insetBy(dx: collectionView.offsetContentInset + self.offsetSectionInset, dy: 0).width
        self.estimatedItemSize = .init(width: width, height: 90.0)
        self.itemSize = UICollectionViewFlowLayout.automaticSize
        self.headerReferenceSize = .init(width: 200, height: 0.0)
        self.register(DecorationView.self, forDecorationViewOfKind:  DecorationViewFlowLayout.kind)
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes: UICollectionViewLayoutAttributes = {
            if let attributes = self.decorationViews[indexPath.section] {
                return attributes
            }
            let attributes = UICollectionViewLayoutAttributes(forDecorationViewOfKind: DecorationViewFlowLayout.kind, with: indexPath)
            self.decorationViews[indexPath.section] = attributes
            return attributes
        }()
        var rect = CGRect.zero
        if let point = self.layoutAttributesForItem(at: IndexPath(row: 0, section: indexPath.section))?.frame.origin {
            rect.origin = point
        }
        if let rows = self.collectionView?.numberOfItems(inSection: indexPath.section), let frame = self.layoutAttributesForItem(at: IndexPath(row: rows - 1, section: indexPath.section))?.frame {
            rect.size = .init(width: frame.maxX - rect.origin.x, height: frame.maxY - rect.origin.y)
        }
        attributes.frame = rect
        attributes.zIndex = -1
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
            guard let baseLayoutAttributes = super.layoutAttributesForElements(in: rect) else {
                return nil
            }
            
            var layoutAttributes = baseLayoutAttributes
            baseLayoutAttributes.filter { $0.representedElementCategory == .cell }.forEach {(layoutAttribute) in
                
                layoutAttributes += DecorationViewFlowLayout.separatorKinds.compactMap({ layoutAttributesForDecorationView(ofKind: $0, at: layoutAttribute.indexPath) })
            }
            
            return layoutAttributes
    }
}



