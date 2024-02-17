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
    case decodingError(String)
    case networkError(AFError)
}

enum RequestType: String {
    case nowPlayingURLString = "3/movie/now_playing"
    case popularURLString = "3/movie/popular"
    case topRatedURLString = "3/movie/top_rated"
}

final class NetworkLayer {
    
    private let apiKey = NetworkConfig.apiKey
    private let basicURLString = NetworkConfig.basicURLString
    
    private func getUrl(type: RequestType) -> URLRequest? {
        guard let url = URL(string: basicURLString + type.rawValue + "?api_key=" + apiKey) else {
            return nil
        }
        return URLRequest(url: url)
    }
    
    func fetchData(from type: RequestType, completion: @escaping (Result<Movie, NetworkLayerError>) -> Void) {
          guard let urlRequest = getUrl(type: type) else {
              completion(.failure(.wrongURL))
              return
          }
          
          AF.request(urlRequest)
              .validate()
              .responseDecodable(of: Movie.self) { response in
                  switch response.result {
                  case .success(let model):
                      completion(.success(model))
                  case .failure(let error):
                      if let decodingError = error as? AFError {
                          completion(.failure(.networkError(decodingError)))
                      } else {
                          completion(.failure(.networkError(error)))
                      }
                  }
              }
            }
    }

