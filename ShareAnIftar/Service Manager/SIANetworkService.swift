//
//  SIANetworkService.swift
//  ShareAnIftar
//
//  @Abstract:
//         Main Transaction class to fire the request to the server. Add JSON parsing code
//
//  Created by Dilgir Siddiqui on 4/9/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import Foundation

class SIANetworkService: NSObject {
    private var task: URLSessionDataTask?
    
    //-------------------------------------------------------------------------
    // Use the below function to make network calls and parse the JSON response
    //-------------------------------------------------------------------------
    func sentRequestFor(serviceName: String, withParameters: [String: AnyObject]?) {
        let sharedTransactionManager = SIATransactionManager.sharedTransactionManager
        let url = sharedTransactionManager.serviceURLFor(service: serviceName)
        // TODO: Replace replacementCode ("#@!$%") with actual service parameters

        let serviceURL = URL.init(string: url)
        let session = URLSession.shared
        task = session.dataTask(with: serviceURL!, completionHandler: { (data, response, error) -> Void in
            
            // TODO: You can also return completionHandler from this method from calling function and do JSON parsing there to make it more cleaner. Some error handling needs to be done there
            if response != nil {
                do {
                    let responseData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print("Response: \(responseData)")
                    // Parse the JSON after this into your model

                } catch {
                    // Do exception handling here
                }
            }
        })
        task?.resume()
    }
    
    //---------------------------------------------
    // Cancel the in progress transaction if needed
    //---------------------------------------------
    func cancel() {
        task?.cancel()
    }
}
