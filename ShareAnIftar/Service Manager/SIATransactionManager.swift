//
//  SIATransactionManager.swift
//  ShareAnIftar
//
//  @Abstract:
//      Forms the request URL using serviceURLForService: function with placeholder string (#@!$%) for request parameters
//
//  Created by Dilgir Siddiqui on 5/18/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import Foundation

class SIATransactionManager: NSObject {
    
    static let sharedTransactionManager = SIATransactionManager()
    
    var services = [String: AnyObject]()
    let baseURL = "http://shareaniftar.com/api/"
    let replacementCode = "#@!$%"
    
    //----------------------------------------------
    // Initialize and fetch Services details from plist
    //----------------------------------------------
    override init() {
        if let resource = Bundle.main.path(forResource: "Services", ofType: "plist"), let services = NSDictionary(contentsOfFile: resource) as? [String: AnyObject] {
            self.services = services
        }
    }
    
    //----------------------------------------------
    // Construct service URL with parameters
    //----------------------------------------------
    func serviceURLFor(service: String, parameters: String) -> String {
        var serviceURL: String?
        
        switch service {
        case  "user_profile":
            serviceURL = "\(baseURL)\(service).php?\(parameters)"
            print("\(serviceURL)")
                //constructURLFor(service: service)
        case "smile_counter":
            serviceURL = "\(baseURL)\(service).php"
            print("\(serviceURL)")

        case "generate_otp":
            serviceURL = "\(baseURL)\(service).php?\(parameters)"
            print("\(serviceURL)")

        case "validate_otp":
            serviceURL = "\(baseURL)\(service).php?\(parameters)"
            print("\(serviceURL)")
        default:
            // Error handling
            break
        }
        
        return serviceURL!
    }
    
    //----------------------------------------------
    // Helper function to get service parameters
    //----------------------------------------------
    func fetchServiceParametersFor(service: String) -> [String: AnyObject]? {
        
        if let parameters = self.services[service] {
            return parameters as? [String : AnyObject]
        } else {
            return nil
        }
    }
    
    //---------------------------------------------------
    // Helper function to construct URL for service calls
    //---------------------------------------------------
    func constructURLFor(service: String) -> String? {
        guard let parameters = fetchServiceParametersFor(service: service) else {
            // Error handling for service parameters not existing
            return nil
        }
        var serviceURL = "\(baseURL)\(service).php?"
        for (index, key) in parameters.keys.enumerated() {
            serviceURL = "\(serviceURL)\(key)=\(replacementCode)"
            if (index+1) != parameters.keys.count {
                serviceURL = "\(serviceURL)&"
            }
        }
        return serviceURL
    }
}
