//
//  ProfileProtocols.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ProfilePresenterToViewProtocol: AnyObject {
    var presenter: ProfileViewToPresenterProtocol? { get set }
}

protocol ProfileInteractorToPresenterProtocol: AnyObject {
}

protocol ProfilePresenterToInteractorProtocol: AnyObject {
    var presenter: ProfileInteractorToPresenterProtocol? { get set }
}

protocol ProfileViewToPresenterProtocol: AnyObject {
    var view: ProfilePresenterToViewProtocol? { get set }
    var interactor: ProfilePresenterToInteractorProtocol? { get set }
    var router: ProfilePresenterToRouterProtocol? { get set }
    func setupView()
}

protocol ProfilePresenterToRouterProtocol: AnyObject {
    static func create() -> UIViewController
}
