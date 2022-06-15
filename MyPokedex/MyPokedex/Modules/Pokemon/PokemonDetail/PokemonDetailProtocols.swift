//
//  PokemonDetailProtocols.swift
//  MyPokedex
//
//  Created by Adrià Ros on 9/4/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailPresenterToViewProtocol: AnyObject {
    var presenter: PokemonDetailViewToPresenterProtocol? { get set }
    var tableView: UITableView! { get set }
}

protocol PokemonDetailInteractorToPresenterProtocol: AnyObject {
    func didLoadData(_ data: Pokemon, favourite: Bool)
}

protocol PokemonDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: PokemonDetailInteractorToPresenterProtocol? { get set }
    func loadData()
    func handleFavourite()
}

protocol PokemonDetailViewToPresenterProtocol: AnyObject {
    var view: PokemonDetailPresenterToViewProtocol? { get set }
    var interactor: PokemonDetailPresenterToInteractorProtocol? { get set }
    var router: PokemonDetailPresenterToRouterProtocol? { get set }
    var pokemon: Pokemon? { get }
    var isFavourite: Bool { get }
    func setupView()
    func favourite()
}

protocol PokemonDetailPresenterToRouterProtocol: AnyObject {
    static func create(item: PokemonListItem, dataProvider: PokemonCloudRepository, imageProvider: ImageProviderUseCase, favouriteProvider: FavouriteDiskRepository) -> UIViewController
}
