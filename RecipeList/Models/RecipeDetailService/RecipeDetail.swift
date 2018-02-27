//
//  RecipeDetails.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/9/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import Foundation

struct RecipeDetail: Decodable {
    var id: String?
    var name: String?
    var totalTime: String?
    var images: [RecipeImage]
    var ingredientLines: [String]?
    var source: Source?
    var attribution: Attribution
}
