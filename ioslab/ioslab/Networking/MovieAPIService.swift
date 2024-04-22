//
//  MovieAPIService.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/3/24.
//

import Foundation
import Alamofire

class MovieApiService {
    let networkConfig = NetworkConfig(apiKey: "149ee263cc6d46569ed4b2f244a2f336", basicURLString: "https://api.themoviedb.org/")
    
    lazy var apiClient: ApiClient = {
        return ApiClient(networkConfig: self.networkConfig)
    }()
    
    func fetchMoviesFromAPI(for category: RequestType, completion: @escaping (Result<Movie, NetworkLayerError>) -> Void) {
        let request = HTTPRequest(method: .get, baseUrl: networkConfig.basicURLString, path: category, queryParameters: [])
        
        apiClient.fetchData(request: request) { apiCallResult in
            self.handleAPICallResult(apiCallResult: apiCallResult, completion: completion)
        }
    }
    
    func fetchActorsFromAPI(completion: @escaping (Result<Actor, NetworkLayerError>) -> Void) {
        let path = "3/person/popular"
        let request = HTTPRequest(method: .get, baseUrl: networkConfig.basicURLString, path: path, queryParameters: [])
        apiClient.fetchData(request: request) { apiCallResult in
            self.handleAPICallResult(apiCallResult: apiCallResult, completion: completion)
        }
    }
    private func handleAPICallResult<T: Decodable>(apiCallResult: Result<Data, NetworkLayerError>, completion: @escaping (Result<T, NetworkLayerError>) -> Void) {
        switch apiCallResult {
        case .success(let data):
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                print("An unexpected error occurred: \(error)")
                completion(.failure(.decodingError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}


