//
//  HTTPClient.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Alamofire

extension URL: URLConvertible {
    public func asURL() throws -> URL {
        return self
    }
}

struct HTTPClient {
    static func performRequest(url: URLConvertible, completion: @escaping (Result<Data, NetworkLayerError>) -> Void) {
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                let httpStatus: HTTPStatus
                
                if let afError = error as? AFError,
                   case let AFError.responseValidationFailed(reason: .unacceptableStatusCode(code)) = afError {
                    httpStatus = HTTPStatus(rawValue: code) ?? .unknown
                } else {
                    httpStatus = .unknown
                }
                
                completion(.failure(NetworkLayerError.networkError(httpStatus)))
            }
        }
    }
}
