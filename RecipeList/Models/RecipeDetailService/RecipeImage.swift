//
//  RecipeImage.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/11/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import Foundation

struct RecipeImage: Decodable {
    var hostedLargeUrl: URL?
    var imageUrlsBySize: [String: URL]
}
