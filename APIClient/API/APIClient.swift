//
//  APIClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - APIClient

public struct APIClient<HC: HTTPClient> {
    
    // MARK: Property
    
    public let router: Router
    
    public let httpClient: HC
    
}
