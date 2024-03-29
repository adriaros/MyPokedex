//
//  HomeCoordinator.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    private var leftBarButtonItem: UIBarButtonItem {
        UIBarButtonItem(image: ImageAsset.Navigation.back.image, style: .plain, target: self, action: #selector(back(_:)))
    }
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    let container: ViewControllerFactory
    
    init(container: ViewControllerFactory) {
        self.container = container
    }
    
    func start() {
        let homeViewController = container.makeHome(coordinator: self)
        navigationController = UINavigationController(rootViewController: homeViewController)
    }
    
    func gameList() {
        let gameListViewController = container.makeGameList(coordinator: self)
        gameListViewController.navigationItem.leftBarButtonItem = leftBarButtonItem
        gameListViewController.navigationItem.title = "Games"
        gameListViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(gameListViewController, animated: true)
    }
    
    func pokemonList() {
        let pokemonListViewController = container.makePokemonList(coordinator: self)
        pokemonListViewController.navigationItem.leftBarButtonItem = leftBarButtonItem
        pokemonListViewController.navigationItem.title = "Pokémons"
        pokemonListViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(pokemonListViewController, animated: true)
    }
    
    func pokemonDetail(item: PokemonListItem) {
        let pokemonDetailViewController = container.makePokemonDetail(item: item)
        pokemonDetailViewController.navigationItem.leftBarButtonItem = leftBarButtonItem
        pokemonDetailViewController.navigationItem.title = "\(item.displayNumber) \(item.displayName)"
        pokemonDetailViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(pokemonDetailViewController, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
