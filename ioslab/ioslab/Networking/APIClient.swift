//
//  APIClient.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation
import Alamofire


class ApiClient {
    static func fetchData(requestType: RequestType, completion: @escaping (Result<Data, NetworkLayerError>) -> Void) {
        do {
            let url = try URLBuilder.buildURL(requestType: requestType)
            HTTPClient.performRequest(url: url) { result in
                switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    handleNetworkError(error, completion: completion)
                }
            }
        } catch {
            completion(.failure(NetworkLayerError.decodingError("Failed to build URL")))
        }
    }

    private static func handleNetworkError(_ error: NetworkLayerError, completion: @escaping (Result<Data, NetworkLayerError>) -> Void) {
        completion(.failure(error))
    }
}
