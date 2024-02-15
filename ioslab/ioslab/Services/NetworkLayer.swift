//
//  NetworkLayer.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 2/14/24.
//

import Foundation
import Alamofire

enum NetworkLayerError: Error {
    case wrongURL
    case decodingError
}

enum RequestType: String {
    case newURLString = "3/movie/top_rated"
    case popularURLString = "3/movie/popular"
    case trendingURLString = "3/movie/now_playing"
}

final class NetworkLayer {
    
    let apiKey = "012c17c153de6b1dd7977abe9ddc4913"
    private let basicURLString = "https://api.themoviedb.org/"
    
    private func getUrl(type: RequestType) -> URLRequest? {
        guard let url = URL(string: basicURLString + type.rawValue + "?api_key=" + apiKey) else {
            return nil
        }
        return URLRequest(url: url)
    }
    
    func fetchData(from type: RequestType, completion: @escaping (Result<Movie, Error>) -> Void) {
        guard let urlRequest = getUrl(type: type) else {
            completion(.failure(NetworkLayerError.wrongURL))
            return
        }
        
        AF.request(urlRequest)
            .validate()
            .responseDecodable(of: Movie.self) { response in
                switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
//    func fetchTopRatedMovies(completion: @escaping (Result<Movie, Error>) -> Void) {
//        fetchData(from: .trendingURLString, completion: completion)
//    }
//    
//    func fetchPopularMovies(completion: @escaping (Result<Movie, Error>) -> Void) {
//        fetchData(from: .popularURLString, completion: completion)
//    }
//    
//    func fetchNowPlayingMovies(completion: @escaping (Result<Movie, Error>) -> Void) {
//        fetchData(from: .newURLString, completion: completion)
//    }
}
