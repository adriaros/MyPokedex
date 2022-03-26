//
//  PokemonsProtocols.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonsPresenterToViewProtocol: AnyObject {
    var presenter: PokemonsViewToPresenterProtocol? { get set }
}

protocol PokemonsInteractorToPresenterProtocol: AnyObject {
}

protocol PokemonsPresenterToInteractorProtocol: AnyObject {
    var presenter: PokemonsInteractorToPresenterProtocol? { get set }
}

protocol PokemonsViewToPresenterProtocol: AnyObject {
    var view: PokemonsPresenterToViewProtocol? { get set }
    var interactor: PokemonsPresenterToInteractorProtocol? { get set }
    var router: PokemonsPresenterToRouterProtocol? { get set }
    func setupView()
}

protocol PokemonsPresenterToRouterProtocol: AnyObject {
    static func create(coordinator: HomeCoordinator?) -> UIViewController
}
