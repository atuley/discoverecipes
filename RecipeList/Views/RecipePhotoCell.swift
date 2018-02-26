//
//  RecipePhotoCell.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/3/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import UIKit

class RecipePhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.insertSublayer(Helpers().createImageGradient(), at: 0)
    }
    
}
