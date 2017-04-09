//
//  SIAHTTPMethod.swift
//  ShareAnIftar
//
//  @Abstract: Define all the enums to be used by Network Layer in this file
//
//  Created by Dilgir Siddiqui on 4/9/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import Foundation

//----------------------------------------------
// Type of HTTP methods to perform HTTP requests
//----------------------------------------------
public enum HTTPMethod: String {
    case post			= "POST"
    case put			= "PUT"
    case get			= "GET"
    case delete         = "DELETE"
}


//-------------------------------------------
// Define the data type of the response
//-------------------------------------------
public enum DataType {
    case JSON
    case XML // This is not being used currently. But, adding it here for any future possible data type response
}


//--------------------------------------------------------------------------
// Define request parameters and define how they are put in the HTTP request
//--------------------------------------------------------------------------
public enum RequestParams {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}
