//
//  PokemonListDetailViewController.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    var presenter: PokemonListViewToPresenterProtocol?
    var activityIndicator: ActivityIndicatorView?
    var imageProvider: ImageProviderUseCase?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.setupView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: PokemonListItemTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: PokemonListItemTableViewCell.cellType)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }
}

extension PokemonListViewController: PokemonListPresenterToViewProtocol {

    func showActivityIndicator() {
        activityIndicator?.start(parent: view)
    }
    
    func hideActivityIndicator() {
        activityIndicator?.stop()
    }
}
