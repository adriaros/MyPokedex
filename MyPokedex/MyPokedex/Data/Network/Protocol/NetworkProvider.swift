//
//  NetworkProvider.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

protocol NetworkProvider {
    func request(provider: NetworkRequestProvider)
}
