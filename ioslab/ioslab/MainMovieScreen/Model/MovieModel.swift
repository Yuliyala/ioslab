//
//  MovieModel.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/9/24.
//


import Foundation

struct Movie: Decodable {
    let results: [MovieResult]?
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    let overview, releaseDate, title: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview, title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
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



