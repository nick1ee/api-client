//
//  PostTests.swift
//  APIClientTests
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: PostTests

import XCTest

@testable import APIClient

internal final class PostTests: XCTestCase {
    
    // MARK: Init
    
    internal final func testInit() {
        
        let post = Post(
            title: "Hello",
            body: "World"
        )
        
        XCTAssertEqual(
            post.title,
            "Hello"
        )
        
        XCTAssertEqual(
            post.body,
            "World"
        )
        
    }
    
    // MARK: JSON
    
    internal final func testInitWithJSON() {
        
        do {
            
            let json: [String: Any] = [
                "title": "Hello",
                "body": "World"
            ]
            
            let post = try Post(json: json)
            
            XCTAssertEqual(
                post.title,
                "Hello"
            )
            
            XCTAssertEqual(
                post.body,
                "World"
            )
            
        }
        catch { XCTFail("\(error)") }
        
    }
    
}
