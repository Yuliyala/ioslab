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

enum MainScreenMovieCategory: String {
    case popular
    case trending
    case newMovies 

    var title: String {
        switch self {
        case .popular:
            return "What's Popular"
        case .trending:
            return "Trending"
        case .newMovies:
            return "New"
        }
    }
}



