//
//  APIClientTests.swift
//  APIClientTests
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - APIClientTests

import XCTest

@testable import APIClient

internal final class APIClientTests: XCTestCase {
    
    // MARK: Init
    
    internal final func testInit() {
        
        let router = StubRouter()
        
        let httpClient = StubHTTPClient()
        
        let apiClient = APIClient(
            router: router,
            httpClient: httpClient
        )
        
        XCTAssertEqual(
            apiClient.router,
            router
        )
        
        XCTAssertEqual(
            apiClient.httpClient,
            httpClient
        )
        
    }
    
}
