//
//  NetworkRequest.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation

struct NetworkRequest: NetworkRequestProvider {
    var url: String = ""
    var method: HTTPMethod = .get
    var queryItems: [QueryItem]?
}
