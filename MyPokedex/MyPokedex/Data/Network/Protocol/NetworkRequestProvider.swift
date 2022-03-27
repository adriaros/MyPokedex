//
//  NetworkRequestProvider.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

protocol NetworkRequestProvider {
    
    var url: String { get set }
    var method: HTTPMethod { get set }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum HTTPStatusCode: Equatable {
    
    case success
    case forbidden
    case unauthorized
    case notFound
    case badRequest
    case serverError
    case unknown
    
    init(statusCode: Int) {
        switch statusCode {
        case 200, 201:
            self = .success
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 500:
            self = .serverError
        default:
            self = .unknown
        }
    }
}

struct NetworkRequest: NetworkRequestProvider {
    
    var url: String = ""
    var method: HTTPMethod = .get
}
