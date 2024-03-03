//
//  NetworkingLayer.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation
import Alamofire

class NetworkLayer {
    static func requestMovies(requestType: RequestType, completion: @escaping (Result<Data, NetworkLayerError>) -> Void) {
        ApiClient.fetchData(requestType: requestType, completion: completion)
    }
}
