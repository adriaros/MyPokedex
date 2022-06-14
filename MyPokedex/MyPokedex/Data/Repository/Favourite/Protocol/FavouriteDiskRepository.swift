//
//  FavouriteDiskRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/6/22.
//

import Foundation

protocol FavouriteDiskRepository {
    func create(id: String?, name: String?, imageUrl: String?)
    func fetchAll() -> [Favourite]
    func fetch(id: String?) -> Favourite?
    func delete(id: String?)
}
