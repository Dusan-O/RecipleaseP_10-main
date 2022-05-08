//
//  FakeResponseData.swift
//  Reciplease_P_10Tests
//
//  Created by Dusan Orescanin on 28/03/2022.
//

import Foundation
import Alamofire

class FakeResponseData {

    // MARK: - DATA
    
    static var recipesCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "LemonRecipes", withExtension: "json")!

        return try! Data(contentsOf: url)
    }

    static let incorrectData = "error".data(using: .utf8)!

    // MARK: - RESPONSE
    
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://www.apple.com")!,
        statusCode: 200, httpVersion: nil, headerFields: nil)!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://www.apple.com")!,
        statusCode: 500, httpVersion: nil, headerFields: nil)!

    // MARK: - ERROR
    
    static let error = AFError.explicitlyCancelled
}
