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
    let gender, id: Int
    let knownForDepartment: KnownForDepartment
    let name, originalName: String
    let popularity: Double
    let profilePath: String?
    let knownFor: [KnownFor]
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

struct KnownFor: Codable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let title: String?
    let originalLanguage: String
    let originalTitle: String?
    let overview, posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum KnownForDepartment: String, Codable {
    case acting = "Acting"
    case writing = "Writing"
}

enum MainScreenCategory: String {
    case popularMovies = "3/movie/popular"
    case topRatedMovies = "3/movie/top_rated"
    case nowPlayingMovies = "3/movie/now_playing"
    
    var title: String {
        switch self {
        case .popularMovies:
            return "What's Popular"
        case .topRatedMovies:
            return "Top Rated"
        case .nowPlayingMovies:
            return "Now Playing"
        }
    }
}
