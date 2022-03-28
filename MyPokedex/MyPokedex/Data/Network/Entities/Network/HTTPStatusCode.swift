//
//  HTTPStatusCode.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation

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
