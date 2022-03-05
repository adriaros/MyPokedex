//
//  Factory.swift
//  MyPokedex
//
//  Created by Adrià Ros on 1/3/22.
//

import Foundation

protocol Factory {
    func makeTabBar() -> TabBarController
    func makeHome() -> HomeViewController
    func makeDetail() -> DetailViewController
    func makeFavourites() -> FavouritesViewController
    func makeProfile() -> ProfileViewController
}
