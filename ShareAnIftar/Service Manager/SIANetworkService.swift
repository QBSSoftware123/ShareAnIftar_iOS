//
//  SIANetworkService.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 4/9/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import Foundation

class SIANetworkService: NSObject {
    private var task: URLSessionDataTask?
    
    // TODO: Check the range of success and failure codes
    fileprivate var successCodes: Range<Int> = 200..<299
    fileprivate var failureCodes: Range<Int> = 400..<499
    
    func request(url: URL,
                 method: HTTPMethod,
                 params: [String: AnyObject]? = nil,
                 headers: [String: String]? = nil,
                 success: ((Data?) -> Void)? = nil,
                 failure: ((_ data: (Data?), _ error: Error?, _ responseCode: Int) -> Void)? = nil) {
        
        let mutableRequest = NSMutableURLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        mutableRequest.allHTTPHeaderFields = headers
        mutableRequest.httpMethod = method.rawValue
        if let params = params {
            mutableRequest.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
        }
        
        let session = URLSession.shared
        // open func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask
        
       // task = session.dataTask(with: mutableRequest) {(data, response, error) -> Void in
            // Check if the response is a success or a failure and send appropriate callback
       // }
        
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}
