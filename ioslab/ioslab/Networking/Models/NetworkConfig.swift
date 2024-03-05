//
//  NetworkConfig.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation

struct NetworkConfig {
    let apiKey: String
    let basicURLString: String

    init(apiKey: String, basicURLString: String) {
        self.apiKey = apiKey
        self.basicURLString = basicURLString
    }
}
