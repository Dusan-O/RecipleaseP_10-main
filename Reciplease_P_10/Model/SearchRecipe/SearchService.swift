//
//  SearchService.swift
//  Reciplease_P_10
//
//  Created by Dusan Orescanin on 28/03/2022.
//

import Foundation

class SearchService {

    // MARK: - PATTERN SINGLETON
    
    static public let searchService = SearchService()

    public init() {}

    // MARK: - PROPERTIES
    
    // List of ingredient
    var ingredientList: [String] = []

    // List of ingredients for the request
    var ingredientListForResquest: String {
        ingredientList.joined(separator:",")
    }

    // MARK: - METHODS
    
    // Method to add ingredient
    func addIngredient(ingredient: String){
        ingredientList.append(ingredient.capitalized)
    }

    // Method to clear ingredient
    func clearIngredients() {
        ingredientList.removeAll()
    }

}
