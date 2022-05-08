//
//  SearchServiceTest.swift
//  Reciplease_P_10Tests
//
//  Created by Dusan Orescanin on 28/03/2022.
//

import XCTest
@testable import Reciplease_P_10

class SearchServiceTest: XCTestCase {

    // MARK: - TESTS SEARCHGSERVICE 
    
    func testAddTwoIngredientAndRemoveAllThenListIsEmpty() throws {
        let s1 = SearchService.searchService
        let egg = "egg"
        s1.addIngredient(ingredient: egg)
        XCTAssertEqual(s1.ingredientListForResquest, egg.capitalized)
        let cream = "cream"
        s1.addIngredient(ingredient: cream)
        XCTAssertEqual(s1.ingredientListForResquest, "\(egg.capitalized),\(cream.capitalized)")
        s1.clearIngredients()
        XCTAssertEqual(s1.ingredientListForResquest, "")

    }

}
