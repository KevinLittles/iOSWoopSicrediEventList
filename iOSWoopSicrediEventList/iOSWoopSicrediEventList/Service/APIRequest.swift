//
//  API.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

public enum RequestType: String {
    case GET, POST, PUT, DELETE
}

import Foundation

class APIRequest {
    
    var baseURL: URL?
    var method: RequestType?
    var parameters = [String: String]()
    
    init(stringURL: String, method: RequestType) {
        self.baseURL = URL(string: stringURL)
        self.method = method
    }
    
    func request() -> URLRequest {
        
        var request = URLRequest(url: baseURL!)
        request.httpMethod = method?.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
}
