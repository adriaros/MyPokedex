//
//  GameListProtocols.swift
//  MyPokedex
//
//  Created by Adrià Ros on 22/5/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GameListPresenterToViewProtocol: AnyObject {
    var presenter: GameListViewToPresenterProtocol? { get set }
    var tableView: UITableView! { get set }
}

protocol GameListInteractorToPresenterProtocol: AnyObject {
    func didLoad(data: [GameListItem]?)
}

protocol GameListPresenterToInteractorProtocol: AnyObject {
    var presenter: GameListInteractorToPresenterProtocol? { get set }
    func loadData()
}

protocol GameListViewToPresenterProtocol: AnyObject {
    var view: GameListPresenterToViewProtocol? { get set }
    var interactor: GameListPresenterToInteractorProtocol? { get set }
    var router: GameListPresenterToRouterProtocol? { get set }
    var items: [GameListItem]? { get set }
    func setupView()
}

protocol GameListPresenterToRouterProtocol: AnyObject {
    static func createModule(coordinator: HomeCoordinator?, dataProvider: GameCloudRepository) -> UIViewController
}
