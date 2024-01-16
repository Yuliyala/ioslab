//
//  MovieModel.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/9/24.
//


import UIKit

// MARK: - Movie Model
struct Movie {
    let albumImageUrl: String
    let rating: Double
    let title: String
    let releaseDate: String
}

enum Category: String {
    case popular = "Popular"
    case trending = "Trending"
    case newMovies = "New"
}





