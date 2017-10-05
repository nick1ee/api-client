//
//  APIClient+PostAPIClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostAPIClient

extension APIClient: PostAPIClient {
    
    public func readPost(completion: @escaping (HTTPResult<Post>) -> Void) {
        
        do {
        
            let endpoint = try router.makeURLRequest()
            
            httpClient.request(endpoint) { result in
                
                switch result {
                    
                case .success(let json):
                    
                    do {
                        
                        let post = try Post(json: json)
                        
                        completion(
                            .success(post)
                        )
                        
                    }
                    catch {
                        
                        completion(
                            .failure(error)
                        )
                        
                    }
                    
                case .failure(let error):
                    
                    completion(
                        .failure(error)
                    )
                    
                }
                
            }
            
        }
        catch {
            
            completion(
                .failure(error)
            )
            
        }
        
    }
    
}
