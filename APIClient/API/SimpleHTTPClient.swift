//
//  SimpleHTTPClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - SimpleAPIClientError

public typealias StatusCode = Int

public enum SimpleAPIClientError: Error {
    
    // MARK: Case
    
    case noResponse
    
    case invalidResponse(StatusCode)
    
    case noData
    
}

// MARK: - SimpleHTTPClient

import Foundation

public struct SimpleHTTPClient {
    
    // MARK: Property
    
    public let session: URLSession
    
    // MARK: Init
    
    public init(session: URLSession = .shared) {
        
        self.session = session
        
    }
    
}

// MARK: - Equatable

extension SimpleHTTPClient: Equatable {
    
    public static func == (
        lhs: SimpleHTTPClient,
        rhs: SimpleHTTPClient) -> Bool {
        
        return lhs.session == rhs.session
        
    }
    
}

// MARK: - HTTPClient

extension SimpleHTTPClient: HTTPClient {

    public typealias Value = Any?

    public func request(
        _ request: URLRequest,
        completion: @escaping (Result<Value>) -> Void) {

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
                    .failure(SimpleAPIClientError.noResponse)
                )

                return

            }

            let statusCode = response.statusCode

            switch statusCode {

            case 200..<300:

                guard
                    let data = data
                else {
                    
                    completion(
                        .failure(SimpleAPIClientError.noData)
                    )
                    
                    return
                    
                }
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data)
                    
                    completion(
                        .success(json)
                    )
                    
                }
                catch {
                    
                    completion(
                        .failure(error)
                    )
                    
                }
                
            default:

                let error: SimpleAPIClientError = .invalidResponse(statusCode)

                completion(
                    .failure(error)
                )

            }

        }

        task.resume()

    }

}
