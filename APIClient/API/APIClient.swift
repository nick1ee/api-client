//
//  APIClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - APIClient

import Foundation

public struct APIClient<R: Router> where R: Equatable {
    
    // MARK: Property
    
    public let router: R
    
    public let session: URLSession
    
}

// MARK: - APIClientError

public typealias StatusCode = Int

public enum APIClientError: Error {
    
    // MARK: Case
    
    case noResponse
    
    case noData
    
    case invalidResponse(StatusCode)
    
}

// MARK: - HTTPClient

extension APIClient: HTTPClient {
    
    public typealias Value = Data?
    
    public func request(
        _ request: URLRequest,
        completion: @escaping (Result<Data?>) -> Void) {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                completion(
                    .failure(error)
                )
                
                return
                
            }
            
            guard
                let response = response as? HTTPURLResponse
            else {
                
                completion(
                    .failure(APIClientError.noResponse)
                )
                
                return
                    
            }
            
            let statusCode = response.statusCode
            
            switch statusCode {
                
            case 200..<300:
                
                completion(
                    .success(data)
                )
                
            default:
                
                let error: APIClientError = .invalidResponse(statusCode)
                
                completion(
                    .failure(error)
                )
                
            }
            
        }
        
        task.resume()
        
    }
    
}
