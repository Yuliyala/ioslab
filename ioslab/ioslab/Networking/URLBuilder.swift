//
//  URLBuilder.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation

struct URLBuilder {
    static func buildURL(requestType: RequestType) throws -> URL {
        guard let urlString = "\(NetworkConfig.basicURLString)\(requestType.rawValue)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlString) else {
                throw NetworkLayerError.wrongURL
        
        }
        return url
       
    }
 
}
