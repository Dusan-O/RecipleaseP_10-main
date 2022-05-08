//
//  URLModel.swift
//  Reciplease_P_10
//
//  Created by Dusan Orescanin on 28/03/2022.
//

import Foundation
import Alamofire

// MARK: - PROTOCOL ALAMOSESSION

protocol AlamoSession {
    func request(with url: URL, callBack: @escaping(_ result: DataResponse<RecipesResult, AFError>?) -> Void)
}

final class SearchSession: AlamoSession {
    func request(with url: URL, callBack: @escaping(_ result: DataResponse<RecipesResult, AFError>?) -> Void) {
        AF.request(url).responseDecodable(of: RecipesResult.self) { (DataResponse) in
            callBack(DataResponse)
        }
    }
}
