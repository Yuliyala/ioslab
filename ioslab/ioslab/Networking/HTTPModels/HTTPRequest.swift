//
//  HTTPRequest.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/5/24.
//

import Foundation

public protocol UrlPathConvertible {
    var path: String { get }
}

public struct HTTPRequest {
    let method: HTTPMethod
    let baseUrl: String
    let path: UrlPathConvertible
    let queryParameters: [URLQueryItem]
}
