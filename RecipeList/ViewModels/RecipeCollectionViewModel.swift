//
//  RecipeCollectionViewModel.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/9/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import UIKit

class RecipeCollectionViewModel {
    fileprivate var recipeSearches = RecipeSearchResult(matches: [])
    
    init(recipeSearches: RecipeSearchResult) {
        self.recipeSearches = recipeSearches
    }
    
    var searchResults: [Match] {
        get {
            return recipeSearches.matches
        }
    }
}

