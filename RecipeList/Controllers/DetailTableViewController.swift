//
//  DetailTableViewController.swift
//  RecipeList
//
//  Created by Alex Tuley on 2/15/18.
//  Copyright © 2018 Alex Tuley. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var recipeUrlLabel: UILabel!
    
    var id: String?
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        
        let screenWidth  = UIScreen.main.fixedCoordinateSpace.bounds.width
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 400)
        
        let startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        let endColor = UIColor.black
        
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        detailImageView.layer.insertSublayer(gradient, at: 0)

        loadRecipe()
    }
    
    // REFACTOR
    override func viewDidLayoutSubviews() {
        let  header = self.tableView.tableHeaderView
        var frame = header?.frame
        frame?.origin = self.tableView.bounds.origin
        header?.frame = frame!
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numRows = viewModel?.ingredients.count else {
            return 0
        }
        return numRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "IngredientCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? IngredientTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RecipeTableViewCell.")
        }
        
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.ingredientLabel.text = self.viewModel?.ingredients[indexPath.row]
        
        return cell
    }
    
    func loadRecipe() {
        RecipeDetailService().getRecipeDetails(with: self.id!) {
            (recipeDetail, error) in
            if error != nil {
                print("Error searching : \(String(describing: error))")
                return
            } else if let recipeDetail = recipeDetail {
                self.viewModel = DetailViewModel(recipeDetail: recipeDetail)
                
                self.navigationItem.title = self.viewModel?.name
                self.recipeNameLabel.text = self.viewModel?.name
                self.creatorNameLabel.text = self.viewModel?.creatorName
                self.recipeUrlLabel.text = self.viewModel?.recipeUrl
                if let url = self.viewModel?.imageUrl {
                    self.detailImageView.image = Helpers().getDetailImage(url: url)
                }
                
                self.tableView.reloadData()
            }
        }
    }
}
