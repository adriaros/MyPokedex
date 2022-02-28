//
//  FavouritesProtocols.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavouritesPresenterToViewProtocol: AnyObject {
    var presenter: FavouritesViewToPresenterProtocol? { get set }
}

protocol FavouritesInteractorToPresenterProtocol: AnyObject {
}

protocol FavouritesPresenterToInteractorProtocol: AnyObject {
    var presenter: FavouritesInteractorToPresenterProtocol? { get set }
}

protocol FavouritesViewToPresenterProtocol: AnyObject {
    var view: FavouritesPresenterToViewProtocol? { get set }
    var interactor: FavouritesPresenterToInteractorProtocol? { get set }
    var router: FavouritesPresenterToRouterProtocol? { get set }
    func setupView()
}

protocol FavouritesPresenterToRouterProtocol: AnyObject {
    static func create() -> UIViewController
}
