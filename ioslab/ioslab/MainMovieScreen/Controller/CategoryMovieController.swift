//
//  CategoryMovieController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 2/15/24.
//

import Foundation


class CategoryMovieController {
    
    let apiService = NetworkLayer()
    
    func fetchPopularMovies( completion: @escaping (Result<[MovieResult], Error>) -> Void) {
        apiService.fetchData(from: RequestType.popularURLString) { result in
            switch result {
            case.success(let data):
                completion(.success(data.results ?? []))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchTrendingMovies( completion: @escaping (Result<[MovieResult], Error>) -> Void) {
        apiService.fetchData(from: RequestType.trendingURLString) { result in
            switch result {
            case.success(let data):
                completion(.success(data.results ?? []))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
