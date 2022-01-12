//
//  ServiceErrorAPIProtocol.swift
//  
//
//  Created by Subhra Roy on 12/01/22.
//

import Foundation

public protocol ServiceErrorProperties{
    var response: HTTPURLResponse { get set}
    var data: Data? { get set}
    var error: Error? { get  set}
    var method: String { get set}
}


public struct ServicePayload: ServiceErrorProperties{
    public var response: HTTPURLResponse
    public var data: Data?
    public var error: Error?
    public var method: String
    
}


public protocol ServiceErrorAPIProtocol{
     func sendErrorLog()
}

protocol NetworkManagerProtocol {
    func sendError(data handler: @escaping (Swift.Result<Data, NetworkError>) -> ())
}
