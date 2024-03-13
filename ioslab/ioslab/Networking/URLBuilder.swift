//
//  URLBuilder.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation

struct URLBuilder {
    let networkConfig: NetworkConfig
    
    init(networkConfig: NetworkConfig) {
        self.networkConfig = networkConfig
    }
    
    public func buildURL(request: HTTPRequest) throws -> URL {
        let urlString = "\(networkConfig.basicURLString)\(request.path.path)"
        guard var urlComponents = URLComponents(string: urlString) else {
            throw NetworkLayerError.urlCannotBeFormed
        }
        let apiKeyItem = URLQueryItem(name: "api_key", value: networkConfig.apiKey)
        urlComponents.queryItems = [apiKeyItem] + request.queryParameters
        
        guard let url = urlComponents.url else {
            throw NetworkLayerError.urlCannotBeFormed
        }
        
        return url
    }
}
