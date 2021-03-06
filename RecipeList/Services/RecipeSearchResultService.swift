//
//  RecipeSearchResultService.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/5/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import Foundation

protocol SearchService {
    func getRecipeSearchResults(with searchPhrase: String, completionHandler: @escaping (RecipeSearchResult?, Error?) -> Void)
}

class RecipeSearchResultService: NSObject, SearchService, URLSessionDelegate {
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration,
                          delegate: self, delegateQueue: OperationQueue.main)
    }()
    
    func getRecipeSearchResults(with searchPhrase: String, completionHandler: @escaping (RecipeSearchResult?, Error?) -> Void) {
        
        let formattedSearchPhrase = searchPhrase.replacingOccurrences(of: " ", with: "+")
        
        //INCREASE RESULTS &maxResult=20
        let searchUrl = "https://api.yummly.com/v1/api/recipes?_app_id=\(Constants.APP_ID)&_app_key=\(Constants.APP_KEY)&q=\(formattedSearchPhrase)&requirePictures=true&maxResult=20"
        print("SEARCH URL: \(searchUrl)")
        
        guard let request = URL(string: searchUrl) else { return }
        
        let dataTask = session.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(RecipeSearchResult.self, from: data)
                print("SEARCH RESULT: \(searchResult.matches.count)")
                completionHandler(searchResult, error)
            }  catch let jsonError {
                completionHandler(nil, error)
                print("There was an error with your API key \n", jsonError)
            }
        }
        dataTask.resume()
        
    }
}
