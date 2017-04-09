//
//  SIARequestProtocol.swift
//  ShareAnIftar
//
//  @Abstract: Implement this protocol in the class/enum handling the Request. This defines all the common properties related to a network request
//
//  Created by Dilgir Siddiqui on 4/9/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import Foundation

public protocol SIARequestProtocol {
    
    // Relative point of the request end point that we want to call
    var path: String { get }
    
    // HTTP method used to perform the request
    var method: HTTPMethod { get }
    
    // Request parameters. Can be sent in the request body or url
    var parameters: RequestParams { get }
    
    // Dictionary to define list of headers to be passed in the HTTP request
    var headers: [String: Any]? { get }
    
    // Type of data the we expect in the response
    var dataType: DataType { get }
}
