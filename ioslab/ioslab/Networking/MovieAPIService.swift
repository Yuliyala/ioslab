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
    func fetchMoviesFromAPI(for category: RequestType, completion: @escaping (Result<[MovieResult], NetworkLayerError>) -> Void) {
        let request = HTTPRequest(method: .get, baseUrl: networkConfig.basicURLString, path: RequestType.nowPlayingURLString as UrlPathConvertible, queryParameters: [])
        
        do {
            let urlBuilder = URLBuilder(networkConfig: networkConfig)
            let url = try urlBuilder.buildURL(request: request)
            
            // Print 
            print("API Request URL: \(url)")
            
            apiClient.fetchData(request: request) { apiCallResult in
                self.handleAPICallResult(apiCallResult: apiCallResult, completion: completion)
            }
        } catch {
            completion(.failure(NetworkLayerError.urlCannotBeFormed))
        }
    }
    
    private func handleAPICallResult(apiCallResult: Result<Data, NetworkLayerError>, completion: @escaping (Result<[MovieResult], NetworkLayerError>) -> Void) {
        switch apiCallResult {
        case .success(let data):
//            print("Received data: \(String(data: data, encoding: .utf8) ?? "")")
            
            do {
                let decoder = JSONDecoder()
                if let moviesArray = try? decoder.decode([MovieResult].self, from: data) {
                    completion(.success(moviesArray))
                } else if let movieObject = try? decoder.decode(MovieResult.self, from: data) {
                    completion(.success([movieObject]))
                } else {
                    throw DecodingError.typeMismatch([MovieResult].self, DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<MovieResult> or a single MovieResult object, but found neither.", underlyingError: nil))
                }
            } catch let error as DecodingError {
                print("Decoding Error: \(error)")
                completion(.failure(.decodingError))
            } catch {
                print("An unexpected error occurred: \(error)")
                completion(.failure(.decodingError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
