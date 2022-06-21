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
    var tableView: UITableView! { get set }
}

protocol FavouritesInteractorToPresenterProtocol: AnyObject {
    func didLoad(data: [Favourite]?)
}

protocol FavouritesPresenterToInteractorProtocol: AnyObject {
    var presenter: FavouritesInteractorToPresenterProtocol? { get set }
    func loadData()
}

protocol FavouritesViewToPresenterProtocol: AnyObject {
    var view: FavouritesPresenterToViewProtocol? { get set }
    var interactor: FavouritesPresenterToInteractorProtocol? { get set }
    var router: FavouritesPresenterToRouterProtocol? { get set }
    var items: [Favourite]? { get set }
    func setupView()
}

protocol FavouritesPresenterToRouterProtocol: AnyObject {
    static func create(dataProvider: FavouriteDiskRepository, imageProvider: ImageProviderUseCase) -> UIViewController
}
