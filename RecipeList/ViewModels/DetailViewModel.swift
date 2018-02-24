//
//  DetailViewModel.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/11/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import Foundation

class DetailViewModel {
    fileprivate var recipeDetail: RecipeDetail
    
    init(recipeDetail: RecipeDetail) {
        self.recipeDetail = recipeDetail
    }
    
    var name: String {
        get {
            return recipeDetail.name!
        }
    }
    
    var creatorName: String {
        get {
            return recipeDetail.source!.sourceDisplayName!
        }
    }
    
    var recipeUrl: String {
        get {
            return recipeDetail.source!.sourceRecipeUrl!
        }
    }
    
    var imageUrl: URL {
        get {
            if let url = recipeDetail.images[0].hostedLargeUrl {
                return url
            }
            return recipeDetail.images[0].imageUrlsBySize["90"]! 
        }
    }
    
    var ingredients: [String] {
        get {
            return recipeDetail.ingredientLines!
        }
    }
}
