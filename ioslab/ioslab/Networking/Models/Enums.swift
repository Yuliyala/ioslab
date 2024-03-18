//
//  Enums.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation

enum RequestType: String, UrlPathConvertible {
    case nowPlaying = "3/movie/now_playing"
    case popular = "3/movie/popular"
    case topRated = "3/movie/top_rated"
    
    var path: String {
        return self.rawValue
    }
}
