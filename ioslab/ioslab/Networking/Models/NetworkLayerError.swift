//
//  NetworkLayerError.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation
import Alamofire

enum NetworkLayerError: Error {
    case wrongURL
    case decodingError(String)
    case networkError(AFError)
}
