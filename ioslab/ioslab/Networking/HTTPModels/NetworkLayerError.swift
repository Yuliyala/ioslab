//
//  NetworkLayerError.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation
import Alamofire

enum NetworkLayerError: Error {
    case urlCannotBeFormed
    case networkError(HTTPStatus)
    case decodingError
    case noData
}
