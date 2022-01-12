//
//  WebAPIManager.swift
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation

struct WebAPIManager: NetworkManagerProtocol {
    private let request: URLRequest
    
    init(url: URL,
         header: [String: String],
         parameter: [String: Any],
         method: String) {
        
        let network = NetworkRequest(url: url, header: header, param: parameter, method: method)
        request = network.httpRequest
    }
    
    func sendError(data handler: @escaping (Swift.Result<Data, NetworkError>) -> ()){
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                handler(.failure(.nodata))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                handler(.failure(.nodata))
                return
            }
            let statusCode = httpResponse.statusCode
            switch statusCode{
                case 200: handler(.success(data))
                default: handler(.failure(.invalid))
            }
        }.resume()
    }
}
