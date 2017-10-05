//
//  JSONError.swift
//  APIClient
//
//  Created by Roy Hsu on 05/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//


// MARK: - JSONError

public enum JSONError: Error {
    
    // MARK: Case
    
    case notObject
    
    case missingValue(forKey: String)
    
}

