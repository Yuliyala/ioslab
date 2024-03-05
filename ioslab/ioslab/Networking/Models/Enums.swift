//
//  Enums.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation

enum RequestType: String, UrlPathConvertible {
    case nowPlayingURLString = "3/movie/now_playing"
    case popularURLString = "3/movie/popular"
    case topRatedURLString = "3/movie/top_rated"

    var path: String {
        return self.rawValue
    }
}
