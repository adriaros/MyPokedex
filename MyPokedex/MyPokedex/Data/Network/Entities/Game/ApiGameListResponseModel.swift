//
//  ApiGameListResponseModel.swift
//  MyPokedex
//
//  Created by Adrià Ros on 21/5/22.
//

import Foundation

struct ApiGameListResponseModel: Codable {
    let results: [ApiGameListResultModel]
}

struct ApiGameListResultModel: Codable {
    let name: String?
    let url: String?
}
