//
//  AlamofireNetwork.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import Alamofire

final class Network {
    typealias CompletionHandler = ((Result<Data, AFError>) -> Void)
    
    init() { }
    
    func request(_ url: String,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding = URLEncoding.queryString,
                 headers: HTTPHeaders? = nil,
                 interceptor: RequestInterceptor? = nil,
                 completion: @escaping CompletionHandler) {
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers,
                   interceptor: interceptor)
            .validate()
            .responseJSON { response in
                if let data = response.data {
                    completion(.success(data))
                } else {
                    completion(.failure(response.error!))
                }
            }
    }
}
