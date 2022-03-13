//
//  DetailProtocols.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailPresenterToViewProtocol: AnyObject {
    var presenter: DetailViewToPresenterProtocol? { get set }
}

protocol DetailInteractorToPresenterProtocol: AnyObject {
}

protocol DetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailInteractorToPresenterProtocol? { get set }
}

protocol DetailViewToPresenterProtocol: AnyObject {
    var view: DetailPresenterToViewProtocol? { get set }
    var interactor: DetailPresenterToInteractorProtocol? { get set }
    var router: DetailPresenterToRouterProtocol? { get set }
    func setupView()
}

protocol DetailPresenterToRouterProtocol: AnyObject {
    static func create() -> UIViewController
}
