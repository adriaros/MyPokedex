//
//  CoreDatabaseProvider.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/6/22.
//

import Foundation

protocol CoreDatabaseProvider {
    func createFavouriteWith(id: String?, name: String?, imageUrl: String?)
    func fetchFavourites() -> [Favourite]
    func fetchFavourite(id: String?) -> Favourite?
    func deleteFavourite(id: String?)
}
