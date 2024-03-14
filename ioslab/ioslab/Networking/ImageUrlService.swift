//
//  ImageUrlService.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/14/24.
//

import Foundation

class ImageUrlService {
    
    func imageUrl(forPath path: String, size: String = "w500") -> URL? {
        return URL(string: "https://image.tmdb.org/t/p/\(size)\(path)")
    }
}
