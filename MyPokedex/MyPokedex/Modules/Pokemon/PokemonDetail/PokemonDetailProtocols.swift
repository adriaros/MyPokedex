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
}

protocol PokemonDetailInteractorToPresenterProtocol: AnyObject {
}

protocol PokemonDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: PokemonDetailInteractorToPresenterProtocol? { get set }
}

protocol PokemonDetailViewToPresenterProtocol: AnyObject {
    var view: PokemonDetailPresenterToViewProtocol? { get set }
    var interactor: PokemonDetailPresenterToInteractorProtocol? { get set }
    var router: PokemonDetailPresenterToRouterProtocol? { get set }
    func setupView()
}

protocol PokemonDetailPresenterToRouterProtocol: AnyObject {
    static func create() -> UIViewController
}
