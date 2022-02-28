//
//  DetailViewController.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupView()
    }
}

extension DetailViewController: DetailPresenterToViewProtocol {

}
