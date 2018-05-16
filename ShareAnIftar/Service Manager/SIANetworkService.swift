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
    
    //Single Ton Default Manager
    static let defaultManger = SIANetworkService()
    
    // LoggedIn Variable
    var userLoggedIn : String?
    
    //-------------------------------------------------------------------------
    // Use the below function to make network calls and parse the JSON response
    //-------------------------------------------------------------------------

    func sentRequestFor(serviceName: String, withParameters: String, completionHandler:@escaping (_ response:Any?,_ errorResponse:Error?)->Void) -> Void {
        let sharedTransactionManager = SIATransactionManager.sharedTransactionManager
        let url = sharedTransactionManager.serviceURLFor(service: serviceName, parameters: withParameters)
        // TODO: Replace replacementCode ("#@!$%") with actual service parameters
        
        let serviceURL = URL(string: url)
        if let serviceURL = serviceURL {
            
            let session = URLSession.shared
            task = session.dataTask(with: serviceURL, completionHandler: { (data, response, error) -> Void in
                
                // TODO: You can also return completionHandler from this method from calling function and do JSON parsing there to make it more cleaner. Some error handling needs to be done there
                if response != nil {
                    do {
                        let responseData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        print("Response: \(responseData)")
                        completionHandler (responseData,error)
                        // Parse the JSON after this into your model
                        
                    } catch {
                        // Do exception handling here
                    }
                }
            })
            task?.resume()
        }
    }
    
    func sentRequestForProfile(serviceName: String, withParameters: String, completionHandler:@escaping (ProfileModel?,_ errorResponse:Error?)->Void) -> Void {
        
        let sharedTransactionManager = SIATransactionManager.sharedTransactionManager
        let url = sharedTransactionManager.serviceURLFor(service: serviceName, parameters: withParameters)
        // TODO: Replace replacementCode ("#@!$%") with actual service parameters
        
        let serviceURL = URL(string: url)
        if let serviceURL = serviceURL {
            
            let session = URLSession.shared
            task = session.dataTask(with: serviceURL, completionHandler: { (data, response, error) -> Void in
                
                // TODO: You can also return completionHandler from this method from calling function and do JSON parsing there to make it more cleaner. Some error handling needs to be done there
                if response != nil {
                    let decoder = JSONDecoder()
                    do {
                        let responseData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        print("Response: \(responseData)")
                        let product = try decoder.decode(ProfileModel.self, from: data!)
                        completionHandler(product, nil)
                        
                    } catch {
                        // Do exception handling here
                    }
                }
            })
            task?.resume()
        }
    }
    
    func sentRequestForDua(serviceName: String, withParameters: String, completionHandler:@escaping (DuaModel?,_ errorResponse:Error?)->Void) -> Void {
        
        let sharedTransactionManager = SIATransactionManager.sharedTransactionManager
        let url = sharedTransactionManager.serviceURLFor(service: serviceName, parameters: withParameters)
        // TODO: Replace replacementCode ("#@!$%") with actual service parameters
        
        let serviceURL = URL(string: url)
        if let serviceURL = serviceURL {
            
            let session = URLSession.shared
            task = session.dataTask(with: serviceURL, completionHandler: { (data, response, error) -> Void in
                
                // TODO: You can also return completionHandler from this method from calling function and do JSON parsing there to make it more cleaner. Some error handling needs to be done there
                if response != nil {
                    let decoder = JSONDecoder()
                    do {
                        let responseData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        print("Response: \(responseData)")
                        let product = try decoder.decode(DuaModel.self, from: data!)
                        completionHandler(product, nil)
                        
                    } catch {
                        // Do exception handling here
                    }
                }
            })
            task?.resume()
        }
    }
    
    func sentRequestForHadith(serviceName: String, withParameters: String, completionHandler:@escaping (HadithModel?,_ errorResponse:Error?)->Void) -> Void {
        
        let sharedTransactionManager = SIATransactionManager.sharedTransactionManager
        let url = sharedTransactionManager.serviceURLFor(service: serviceName, parameters: withParameters)
        // TODO: Replace replacementCode ("#@!$%") with actual service parameters
        
        let serviceURL = URL(string: url)
        if let serviceURL = serviceURL {
            
            let session = URLSession.shared
            task = session.dataTask(with: serviceURL, completionHandler: { (data, response, error) -> Void in
                
                // TODO: You can also return completionHandler from this method from calling function and do JSON parsing there to make it more cleaner. Some error handling needs to be done there
                if response != nil {
                    let decoder = JSONDecoder()
                    do {
                        let responseData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        print("Response: \(responseData)")
                        let product = try decoder.decode(HadithModel.self, from: data!)
                        completionHandler(product, nil)
                        
                    } catch {
                        // Do exception handling here
                    }
                }
            })
            task?.resume()
        }
    }


    
    //---------------------------------------------
    // Cancel the in progress transaction if needed
    //---------------------------------------------
    func cancel() {
        task?.cancel()
    }
}
