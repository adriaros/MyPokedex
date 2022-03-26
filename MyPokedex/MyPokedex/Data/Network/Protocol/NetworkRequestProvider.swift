//
//  NetworkRequestProvider.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

protocol NetworkRequestProvider {
    
    var url: URL { get set }
    var method: HTTPMethod { get set }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

