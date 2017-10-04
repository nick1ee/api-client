//
//  Post.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Post

public struct Post {
    
    // MARK: Property
    
    public let title: String
    
    public let body: String
    
}

// MARK: - Equatable

extension Post: Equatable {
    
    public static func == (lhs: Post, rhs: Post) -> Bool {
        
        return lhs.title == rhs.title
            && lhs.body == rhs.body
        
    }
    
}

// MARK: - Object

public typealias Object = [String: Any]

// MARK: - JSONError

public enum JSONError: Error {
    
    // MARK: Case
    
    case notObject
    
    case missingValue(forKey: String)
    
}

// MARK: - JSON

public extension Post {
    
    // MARK: Schema
    
    public struct Schema {
    
        public static let title = "title"
        
        public static let body = "body"
    
    }
    
    // MARK: Init
    
    public init(json: Any) throws {
        
        guard
            let object = json as? Object
        else { throw JSONError.notObject }
        
        guard
            let title = object[Schema.title] as? String
        else { throw JSONError.missingValue(forKey: Schema.title) }
        
        self.title = title
        
        guard
            let body = object[Schema.body] as? String
            else { throw JSONError.missingValue(forKey: Schema.body) }
        
        self.body = body
        
    }
    
}
