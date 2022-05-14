//
//  PokemonListProtocols.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonListPresenterToViewProtocol: AnyObject {
    var presenter: PokemonListViewToPresenterProtocol? { get set }
    var tableView: UITableView! { get set }
    func showActivityIndicator()
    func hideActivityIndicator()
}

protocol PokemonListInteractorToPresenterProtocol: AnyObject {
    func didLoad(data: [PokemonListItemModel]?)
}

protocol PokemonListPresenterToInteractorProtocol: AnyObject {
    var presenter: PokemonListInteractorToPresenterProtocol? { get set }
    func loadData()
}

protocol PokemonListViewToPresenterProtocol: AnyObject {
    var view: PokemonListPresenterToViewProtocol? { get set }
    var interactor: PokemonListPresenterToInteractorProtocol? { get set }
    var router: PokemonListPresenterToRouterProtocol? { get set }
    var items: [PokemonListItemModel]? { get set }
    func setupView()
    func itemSelected(at row: Int)
}

protocol PokemonListPresenterToRouterProtocol: AnyObject {
    static func create(coordinator: HomeCoordinator?, dataProvider: PokemonListLoaderUseCase?) -> UIViewController
    func pushToDetail(item: PokemonListItemModel?)
}
