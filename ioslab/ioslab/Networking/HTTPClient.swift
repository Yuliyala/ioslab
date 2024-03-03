//
//  HTTPClient.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation
import Alamofire

struct HTTPClient {
    static func performRequest(url: URL, completion: @escaping (Result<Data, NetworkLayerError>) -> Void) {
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(NetworkLayerError.networkError(error)))
            }
        }
    }
}
