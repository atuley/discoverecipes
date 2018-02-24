//
//  GridLayout.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/4/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    var numberOfColumns: Int = 2
    
    init(numberOfColumns: Int) {
        super.init()
        self.numberOfColumns = numberOfColumns
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    override var itemSize: CGSize {
        get {
            if let collectionView = collectionView {
                let collectionViewWidth = collectionView.frame.width
                
                numberOfColumns = determineNumberOfColumns(collectionViewWidth: collectionViewWidth)
                let itemWidth = (collectionViewWidth / CGFloat(numberOfColumns)) - self.minimumInteritemSpacing
                let itemHeight: CGFloat = 200
                
                return CGSize(width: itemWidth, height: itemHeight)
            }
            
            return CGSize(width: 100, height: 100)
        }
        set {
            super.itemSize = newValue
        }
    }
    
    private func determineNumberOfColumns(collectionViewWidth: CGFloat) -> Int {
        return collectionViewWidth <= 414 ? 1 : numberOfColumns
    }
}
