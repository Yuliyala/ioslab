//
//  MovieService.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation

class MovieService {
    private let apiService = MovieApiService()

    func fetchMovies(for category: RequestType, completion: @escaping (Result<[MovieResult], NetworkLayerError>) -> Void) {
        apiService.fetchMovies(for: category) { result in
            completion(result)
        }
    }
}
