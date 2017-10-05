//
//  StubHTTPClient.swift
//  APIClientTests
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - StubHTTPClient

import Foundation
import APIClient

internal struct StubHTTPClient: HTTPClient {
    
    typealias Value = Any
    
    func request(
        _ request: URLRequest,
        completion: @escaping (HTTPResult<Value>) -> Void) {
        
        let json: [String: Any] = [
            "title": "Hello",
            "body": "World"
        ]
        
        completion(
            .success(json)
        )
        
    }
    
}
