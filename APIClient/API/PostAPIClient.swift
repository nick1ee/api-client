//
//  PostAPIClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostAPIClient

public protocol PostAPIClient {
    
    func readPost(completion: @escaping (_ result: Result<Post>) -> Void)
    
}
