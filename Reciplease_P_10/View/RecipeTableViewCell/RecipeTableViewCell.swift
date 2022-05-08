//
//  RecipeTableViewCell.swift
//  Reciplease_P_10
//
//  Created by Dusan Orescanin on 28/03/2022.
//

import UIKit
import AlamofireImage

// MARK: - IBOUTLET

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeCookingTime: UILabel!
    @IBOutlet weak var recipeLikeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        /// Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        /// Configure the view for the selected state
    }

    func commonInit(with imageURL: String, title:String, cookingTime: String, like: String) {
        recipeTitle.text = title
        recipeCookingTime.text = cookingTime
        recipeLikeLabel.text = like
        guard let url = URL(string: imageURL) else {
            recipeImageView.image = UIImage(named: "photoRecette")
            return
        }
        recipeImageView.af.setImage(withURL: url)
    }


}
