//
//  MovieCategoryController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 2/15/24.
//

import Foundation

class MovieCategoryController {

    let apiService = NetworkLayer()

    func fetchPopularMovies(completion: @escaping (Result<[MovieResult], Error>) -> Void) {
        fetchData(from: .popularURLString, completion: completion)
    }

    func fetchTopRatedMovies(completion: @escaping (Result<[MovieResult], Error>) -> Void) {
        fetchData(from: .topRatedURLString, completion: completion)
    }

    func fetchNowPlayingMovies(completion: @escaping (Result<[MovieResult], Error>) -> Void) {
        fetchData(from: .nowPlayingURLString, completion: completion)
    }

    private func fetchData(from type: RequestType, completion: @escaping (Result<[MovieResult], Error>) -> Void) {
        apiService.fetchData(from: type) { result in
            switch result {
            case .success(let data):
                completion(.success(data.results ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

