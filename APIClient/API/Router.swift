//
//  Router.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Router

import Foundation

public protocol Router {
    
    // MARK: URLRequest
    
    func makeURLRequest() throws -> URLRequest
    
}

// MARK: - Equatable (Default Implementation)

extension Router {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        
        do {
            
            let lhsRequest = try lhs.makeURLRequest()
            
            let rhsRquest = try rhs.makeURLRequest()
            
            return lhsRequest == rhsRquest
            
        }
        catch { return false }
        
    }
    
}
