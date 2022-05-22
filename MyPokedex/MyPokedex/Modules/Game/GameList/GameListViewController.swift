//
//  GameListViewController.swift
//  MyPokedex
//
//  Created by Adrià Ros on 22/5/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController {
    
    var presenter: GameListViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension GameListViewController: GameListPresenterToViewProtocol {

}
