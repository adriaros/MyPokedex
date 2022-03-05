//
//  FavouritesCoordinator.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import Foundation
import UIKit

class FavouritesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    let container: Factory
    
    init(container: Factory) {
        self.container = container
    }
    
    func start() {
        let favouritesViewController = container.makeFavourites()
        navigationController = UINavigationController(rootViewController: favouritesViewController)
    }
}
