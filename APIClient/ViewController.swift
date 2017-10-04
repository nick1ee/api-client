//
//  ViewController.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

import UIKit

public final class ViewController: UIViewController {

    public final let client: PostAPIClient = APIClient(
        router: APIRouter.readPost(id: "1"),
        httpClient: SimpleHTTPClient()
    )
    
    public final override func viewDidLoad() {
        super.viewDidLoad()
        
        client.readPost { result in
            
            print(result)
            
        }
        
    }

}

