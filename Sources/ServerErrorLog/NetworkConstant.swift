//
//  NetworkConstant.swift
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation

enum NetworkError: Error{
    case invalid
    case nodata
    case success
}

protocol NetworkRequestProtocol {
    var httpRequest: URLRequest { get }
}

struct NetworkRequest: NetworkRequestProtocol {
    
     let url: URL
     let header: [String: String]?
     let param: [String: Any]?
     let method: String
    
    var httpRequest: URLRequest{
        
        var request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        request.httpMethod = method.uppercased()
        
        if let _header = header {
            request.allHTTPHeaderFields = _header
        }
        
        if let _param = param{
          request.httpBody = try? JSONSerialization.data(withJSONObject: _param, options: JSONSerialization.WritingOptions.fragmentsAllowed)
        }
        
        return request
    }
     
}


