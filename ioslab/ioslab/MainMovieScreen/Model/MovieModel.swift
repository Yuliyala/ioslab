//
//  MovieModel.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/9/24.
//


import Foundation

struct Movie: Decodable {
    let results: [MovieResult]
}

struct MovieResult: Decodable {
    let id: Int
    let posterPath: String
    let overview, releaseDate, title: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview, title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

struct Actor: Decodable {
    let page: Int
    let results: [ActorResult]
}

struct ActorResult: Decodable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let knownFor: [MovieResult]
}


enum MainScreenCategory: String {
    case popularMovies = "3/movie/popular"
    case topRatedMovies = "3/movie/top_rated"
    case nowPlayingMovies = "3/movie/now_playing"
    case popularActors = "3/person/popular"
    
    var title: String {
        switch self {
        case .popularMovies:
            return "What's Popular"
        case .topRatedMovies:
            return "Top Rated"
        case .nowPlayingMovies:
            return "Now Playing"
        case .popularActors:
            return "Popular Actors" 
        }
    }
}
