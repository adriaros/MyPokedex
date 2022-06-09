//
//  HomeProtocols.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomePresenterToViewProtocol: AnyObject {
    var presenter: HomeViewToPresenterProtocol? { get set }
    var tableView: UITableView! { get set }
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
}

protocol HomePresenterToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
}

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    func selectPokemon()
    func selectGames()
}

protocol HomePresenterToRouterProtocol: AnyObject {
    static func create(coordinator: HomeCoordinator?) -> UIViewController
    func pokemonList()
    func gameList()
}
