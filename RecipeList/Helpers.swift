//
//  Helpers.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/12/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import UIKit

class Helpers {
    func getDetailImage(url: URL) -> UIImage {
        let newUrl = useHttps(url: url)
        
        if let imageData = try? Data(contentsOf: newUrl) {
            return UIImage(data: imageData)!
        }
        
        return UIImage()
    }
    
    func useHttps(url: URL) -> URL {
        return String(describing: url).range(of:"http:") != nil ? URL(string: String(describing: url).replacingOccurrences(of: "http:", with: "https:"))! : url
    }
}
