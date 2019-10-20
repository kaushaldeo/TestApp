//
//  CollectionViewFlowLayout.swift
//  TestApp
//
//  Created by Kaushal Deo on 10/19/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = self.collectionView else { return }
        self.itemSize = UICollectionViewFlowLayout.automaticSize
        let width = collectionView.bounds.width - (self.sectionInset.horizontalOffset)
        self.estimatedItemSize = CGSize(width: width, height: 70.0)
        self.minimumLineSpacing = 1.0
        self.minimumInteritemSpacing = 1.0
    }
}

extension UIEdgeInsets {
    var verticalOffset: CGFloat {
        return self.bottom + self.top
    }
    
    var horizontalOffset: CGFloat {
        return self.left + self.right
    }
}
