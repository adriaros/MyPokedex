//
//  FavouritesViewController.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    var presenter: FavouritesViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}

extension FavouritesViewController: FavouritesPresenterToViewProtocol {

}
