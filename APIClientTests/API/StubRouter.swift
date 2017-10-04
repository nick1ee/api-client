//
//  StubRouter.swift
//  APIClientTests
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - StubRouter

import Foundation

@testable import APIClient

internal struct StubRouter: Router {
    
    // MARK: Router
    
    func makeURLRequest() throws -> URLRequest {
        
        let url = URL(string: "http://foo.com/api/bar")!
        
        return URLRequest(url: url)
        
    }
    
}

// MARK: - Equatable

extension StubRouter: Equatable {
    
    public static func == (lhs: StubRouter, rhs: StubRouter) -> Bool {
        
        do {
            
            let lhsRequest = try lhs.makeURLRequest()
            
            let rhsRquest = try rhs.makeURLRequest()
            
            return lhsRequest == rhsRquest
            
        }
        catch { return false }
        
    }
    
}
