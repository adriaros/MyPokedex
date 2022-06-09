//
//  NetworkRXProvider.swift
//  MyPokedex
//
//  Created by Adrià Ros on 15/5/22.
//

import Foundation
import RxSwift

protocol NetworkRXProvider {
    func request(provider: NetworkRequestProvider) -> Observable<Data?>
}
