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
    
    let container: Factory
    
    init(container: Factory) {
        self.container = container
    }
    
    func start() {
        let homeViewController = container.makeHome(coordinator: self)
        navigationController = UINavigationController(rootViewController: homeViewController)
    }
    
    func pokemonList() {
        let pokemonListViewController = container.makePokemonList()
        pokemonListViewController.navigationItem.leftBarButtonItem = leftBarButtonItem
        pokemonListViewController.navigationItem.title = "Pokémons"
        navigationController?.pushViewController(pokemonListViewController, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
