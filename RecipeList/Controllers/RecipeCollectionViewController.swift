//
//  RecipeCollectionViewController.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/2/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import UIKit

final class RecipeCollectionViewController: UICollectionViewController {
    fileprivate var viewModel: RecipeCollectionViewModel = RecipeCollectionViewModel(recipeSearches: RecipeSearchResult(matches: []))
    
    fileprivate let reuseIdentifier = "RecipeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.darkGray
        collectionView?.collectionViewLayout = GridLayout(numberOfColumns: 2)
        collectionView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "moreInfo") {
            let destinationViewController = segue.destination as! DetailTableViewController
            let cell = sender as! RecipePhotoCell
            let indexPath = self.collectionView?.indexPath(for: cell)
            
            destinationViewController.id = viewModel.searchResults[indexPath!.row].id!
        }
    }
}

extension RecipeCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return viewModel.searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! RecipePhotoCell
        let currentCellId = viewModel.searchResults[indexPath.row].id
        
        RecipeDetailService().getRecipeDetails(with: currentCellId!) {
            (recipeDetail, error) in
            if error != nil {
                print("Error searching : \(String(describing: error))")
                return
            } else if let recipeDetail = recipeDetail {
                cell.recipeNameLabel.text = recipeDetail.name
                guard let imageUrl = recipeDetail.images[0].hostedLargeUrl else {
                    return cell.imageView.image = Helpers().getDetailImage(url: recipeDetail.images[0].imageUrlsBySize["90"]!)
                }
                cell.imageView.image = Helpers().getDetailImage(url: imageUrl)
                cell.sourceNameLabel.text = self.viewModel.searchResults[indexPath.row].sourceDisplayName
            }
        }
                
        return cell
    }
}

extension RecipeCollectionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)

        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
 
        activityIndicator.startAnimating()
        
        RecipeSearchResultService().getRecipeSearchResults(with: textField.text!) {
            (searchResult, error) in
            activityIndicator.removeFromSuperview()

            if error != nil {
                print("Error searching : \(String(describing: error))")
                return
            } else if let searchResult = searchResult {
                self.viewModel = RecipeCollectionViewModel(recipeSearches: searchResult)
                self.collectionView?.reloadData()
            }
        }

        textField.text = nil
        textField.resignFirstResponder()
        
        return true
    }
}
