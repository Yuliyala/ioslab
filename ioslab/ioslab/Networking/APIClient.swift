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

            HTTPClient.performRequest(url: url) { result in
                switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    self.handleNetworkError(error, completion: completion)
                }
            }
        } catch {
            completion(.failure(NetworkLayerError.decodingError))
        }
    }

    private func handleNetworkError(_ error: NetworkLayerError, completion: @escaping (Result<Data, NetworkLayerError>) -> Void) {
        completion(.failure(error))
    }
}
