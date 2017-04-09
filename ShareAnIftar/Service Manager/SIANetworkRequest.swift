//
//  SIANetworkRequest.swift
//  ShareAnIftar
//
//  @Abstract: Configure all the parameters of every request here
//
//  Created by Dilgir Siddiqui on 4/9/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import Foundation

public enum SIANetworkRequest: SIARequestProtocol {
    
    // Define all the API calls in below cases
    case login(username: String, password: String)
    case fetchDonationCounts()
    case fetchIftarMenu()
    
    
    // MARK: Implement protocol methods
    public var path: String {
        switch self {
        case .login(_,_):
            return "user/login"
        case .fetchDonationCounts():
            return "user/fetchDonationCounts"
        case .fetchIftarMenu():
            return "user/fetchIftarMenu"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .login(_,_):
            return .post
        case .fetchDonationCounts():
            return .get
        case .fetchIftarMenu():
            return .get
        }
    }
    
    public var parameters: RequestParams {
        switch self {
        case .login(let username,let password):
            return .body(["user" : username, "pass" : password])
        case .fetchDonationCounts():
            return .url(nil)
        case .fetchIftarMenu():
            return .url(nil)
        }
    }
    
    public var headers: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    public var dataType: DataType {
        switch self {
        case .login(_,_):
            return .JSON
        case .fetchDonationCounts(_):
            return .JSON
        case .fetchIftarMenu():
            return .JSON
        }
    }
}

// Add the permanent parameters in each request in the below dictionary, no need to add it again and again for every request
extension SIARequestProtocol {
    
    func defaultJSONHeaders() -> [String: String] {
        return ["Content-Type": "application/json"]
    }
}
