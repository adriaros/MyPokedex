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
    
    func pokemons() {
        let pokemonsViewController = container.makePokemons(coordinator: self)
        pokemonsViewController.navigationItem.leftBarButtonItem = leftBarButtonItem
        pokemonsViewController.navigationItem.title = "Pokémons"
        navigationController?.pushViewController(pokemonsViewController, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
