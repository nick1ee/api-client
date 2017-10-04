//
//  PostAPIClientTests.swift
//  APIClientTests
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostAPIClientTests

import XCTest

@testable import APIClient

internal final class PostAPIClientTests: XCTestCase {
    
    // MARK: Property
    
    internal final var client: PostAPIClient?
    
    // MARK: Set Up
    
    internal final override func setUp() {
        super.setUp()
        
    }
    
    internal final override func tearDown() {
        
        client = nil
        
        super.tearDown()
    }
    
    // MARK: Read Post
    
    internal final func testReadPost() {
        
        let promise = expectation(description: "Read a post.")
        
        guard
            let client = client
        else {
            
            promise.fulfill()
            
            XCTFail("Missing a client.")
            
            return
            
        }
        
        client.readPost { result in
            
            promise.fulfill()
            
            switch result {
                
            case .success(let post):
                
                XCTAssertEqual(
                    post,
                    Post(
                        title: "Hello",
                        body: "World"
                    )
                )
                
            case .failure(let error):
                
                XCTFail("\(error)")
                
            }
            
        }
        
        wait(
            for: [ promise ],
            timeout: 10.0
        )
        
    }
    
}
