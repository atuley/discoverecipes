//
//  RecipeListTests.swift
//  RecipeListTests
//
//  Created by Alex Tuley on 2/1/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import XCTest
@testable import RecipeList

class RecipeListTests: XCTestCase {
    var collectionViewModelUnderTest: RecipeCollectionViewModel!
    var detailViewUnderTest: DetailViewModel!
    
    override func setUp() {
        super.setUp()
        
        detailViewUnderTest =  DetailViewModel(recipeDetail: RecipeDetail(id: "", name: "", totalTime: "", images: [], ingredientLines: [], source: Source(sourceDisplayName: "", sourceRecipeUrl: "")))
        collectionViewModelUnderTest = RecipeCollectionViewModel(recipeSearches: RecipeSearchResult(matches: []))
    }
    
    override func tearDown() {
        detailViewUnderTest = nil
        collectionViewModelUnderTest = nil
        
        super.tearDown()
    }
    
    func testRecipeCollectionViewModelSendsBackCorrectValuesWhenCreated() {
        var recipeSearches = RecipeSearchResult(matches: [])
        recipeSearches.matches.append(Match(id: "Classic-French-Onion-Soup-1902694",
                                            recipeName: "Classic French Onion Soup",
                                            imageUrlsBySize:
                                                ["90": URL(string: "https://lh3.googleusercontent.com/qEFZSrBMWiDO2V1JZWWclpfNHCYhR583zshoD0N8MlrEE5PPfL-y0RYur8f8kJXxtJlL5RpYoTiWPVjSjUef=s90-c")],
                                            sourceDisplayName: ""))
        
        collectionViewModelUnderTest = RecipeCollectionViewModel(recipeSearches: recipeSearches)
        
        XCTAssertEqual(collectionViewModelUnderTest.searchResults.count, 1)
        XCTAssertEqual(collectionViewModelUnderTest.searchResults[0].id, "Classic-French-Onion-Soup-1902694")
        XCTAssertEqual(collectionViewModelUnderTest.searchResults[0].recipeName, "Classic French Onion Soup")
        XCTAssertEqual(collectionViewModelUnderTest.searchResults[0].imageUrlsBySize["90"]!, URL(string: "https://lh3.googleusercontent.com/qEFZSrBMWiDO2V1JZWWclpfNHCYhR583zshoD0N8MlrEE5PPfL-y0RYur8f8kJXxtJlL5RpYoTiWPVjSjUef=s90-c"))
    }
    
    func testDetailViewModelSendsBackCorrectValuesWhenCreated() {
        let recipeDetail = RecipeDetail(id: "French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364",
                                        name: "French Onion Soup", totalTime: "1 hr 45 min",
                                        images: [RecipeImage(hostedLargeUrl: URL(string: "https://lh3.googleusercontent.com/mlXIyLttB8R7uqF6SayvQp_GSFdWIyalBMpZS5vAznMtw2fs-Xw5XxfmsUxYrn2IYYJ27r3Y7WUEGNAt43z-RA=s360"),
                                                             imageUrlsBySize: [:])],
                                        ingredientLines: [],
                                        source: Source(sourceDisplayName: "", sourceRecipeUrl: ""))
        detailViewUnderTest = DetailViewModel(recipeDetail: recipeDetail)
        
        XCTAssertEqual(detailViewUnderTest.name, "French Onion Soup")
        XCTAssertEqual(detailViewUnderTest.imageUrl, URL(string: "https://lh3.googleusercontent.com/mlXIyLttB8R7uqF6SayvQp_GSFdWIyalBMpZS5vAznMtw2fs-Xw5XxfmsUxYrn2IYYJ27r3Y7WUEGNAt43z-RA=s360"))
    }
}
