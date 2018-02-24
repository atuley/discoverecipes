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

        let screenWidth  = UIScreen.main.fixedCoordinateSpace.bounds.width
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 400)
        
        let startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        let endColor = UIColor.black
        
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        imageView.layer.insertSublayer(gradient, at: 0)
    }
    
}
