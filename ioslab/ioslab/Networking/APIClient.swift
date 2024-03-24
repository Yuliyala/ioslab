//
//  APIClient.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation
import Alamofire

class ApiClient {
    var networkConfig: NetworkConfig
    
    init(networkConfig: NetworkConfig) {
        self.networkConfig = networkConfig
    }
    
    func fetchData(request: HTTPRequest, completion: @escaping (Result<Data, NetworkLayerError>) -> Void) {
        do {
            let urlBuilder = URLBuilder(networkConfig: networkConfig)
            let url = try urlBuilder.buildURL(request: request)
            AF.request(url).validate().responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    let httpStatus: HTTPStatus
                    
                    if let afError = error.asAFError,
                       case let AFError.responseValidationFailed(reason: .unacceptableStatusCode(code)) = afError {
                        httpStatus = HTTPStatus(rawValue: code) ?? .unknown
                    } else {
                        httpStatus = .unknown
                    }
                    
                    completion(.failure(NetworkLayerError.networkError(httpStatus)))
                }
            }
        } catch {
            completion(.failure(NetworkLayerError.urlCannotBeFormed))
        }
    }
}
