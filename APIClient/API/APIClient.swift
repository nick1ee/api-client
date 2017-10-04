//
//  APIClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - APIClient

import Foundation

public struct APIClient<R: Router, C: HTTPClient> where
    R: Equatable,
    C: Equatable {
    
    // MARK: Property
    
    public let router: R
    
    public let httpClient: C
    
}
