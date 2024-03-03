//
//  MovieAPIService.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation
import Alamofire

class MovieApiService {
    func fetchMovies(for category: RequestType, completion: @escaping (Result<[MovieResult], NetworkLayerError>) -> Void) {
        NetworkLayer.requestMovies(requestType: category) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let movies = try decoder.decode([MovieResult].self, from: data)
                    completion(.success(movies))
                } catch {
                    completion(.failure(.decodingError("Failed to decode movies")))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
