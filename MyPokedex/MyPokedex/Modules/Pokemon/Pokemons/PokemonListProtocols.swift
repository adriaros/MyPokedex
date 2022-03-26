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
}

protocol PokemonListInteractorToPresenterProtocol: AnyObject {
}

protocol PokemonListPresenterToInteractorProtocol: AnyObject {
    var presenter: PokemonListInteractorToPresenterProtocol? { get set }
}

protocol PokemonListViewToPresenterProtocol: AnyObject {
    var view: PokemonListPresenterToViewProtocol? { get set }
    var interactor: PokemonListPresenterToInteractorProtocol? { get set }
    var router: PokemonListPresenterToRouterProtocol? { get set }
    func setupView()
}

protocol PokemonListPresenterToRouterProtocol: AnyObject {
    static func create(coordinator: HomeCoordinator?) -> UIViewController
}
