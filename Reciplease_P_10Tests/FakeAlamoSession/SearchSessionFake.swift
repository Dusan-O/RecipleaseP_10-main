//
//  FakeAlamoRequest.swift
//  Reciplease_P_10Tests
//
//  Created by Dusan Orescanin on 28/03/2022.
//

import Foundation
import Alamofire
@testable import Reciplease_P_10

struct FakeAlamoResponse {
    var data: Data?
    var response: HTTPURLResponse?
    var error : AFError?

}


class SearchSessionFake: AlamoSession {

    // MARK: - METHOD OF PROTOCOL COMPLIANCE
    
    func request(with url: URL, callBack: @escaping (_ result: DataResponse<RecipesResult, AFError>?) -> Void) {
        guard let httpResponse = fakeAlamoResponse.response else {
            callBack(.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0.0, result: .failure(.explicitlyCancelled)))
            return
        }
        guard let requestData = fakeAlamoResponse.data else {
            callBack(.init(request: nil, response: httpResponse, data: nil, metrics: nil, serializationDuration: 0.0, result: .failure(.explicitlyCancelled)))
            return
        }
        let urlRequest = URLRequest(url: url)
        guard let object = try? JSONDecoder().decode(RecipesResult.self, from: requestData) else {
            callBack(.init(request: urlRequest, response: httpResponse, data: requestData, metrics: nil, serializationDuration: 0.0, result: .failure(.explicitlyCancelled)))
            return
        }
        let result: Result<RecipesResult,AFError> = fakeAlamoResponse.error == nil ? .success(object as RecipesResult) : .failure(fakeAlamoResponse.error ?? AFError.explicitlyCancelled)
        let dataResponse = AFDataResponse(request: urlRequest, response: httpResponse, data: requestData, metrics: nil, serializationDuration: 0.0, result: result)
        callBack(dataResponse)
    }

    // MARK: - PROPERTIES
    
    private let fakeAlamoResponse: FakeAlamoResponse

    // MARK: - INITIALIZER
    
    init(fakeResponse: FakeAlamoResponse) {
        self.fakeAlamoResponse = fakeResponse
    }

}

