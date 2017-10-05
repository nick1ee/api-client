//
//  HTTPClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - HTTPResult

public enum HTTPResult<Value> {
    
    case success(Value)
    
    case failure(Error)
    
}

// MARK: - HTTPClient

import Foundation

public protocol HTTPClient {
    
    associatedtype Value
    
    // MARK: Request
    
    func request(
        _ request: URLRequest,
        completion: @escaping (_ result: HTTPResult<Value>) -> Void
    )
    
}
