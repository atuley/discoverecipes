//
//  Match.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/5/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import Foundation

struct Match: Decodable {
    var id: String?
    var recipeName: String?
    var imageUrlsBySize: [String: URL?]
    var sourceDisplayName: String?
}
