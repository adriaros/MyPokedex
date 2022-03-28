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
    var queryItems: [QueryItem]? { get set }
}
