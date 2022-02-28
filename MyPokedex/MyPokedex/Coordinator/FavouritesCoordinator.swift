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
    
    func start() {
        let favouritesViewController = FavouritesRouter.create()
        navigationController = UINavigationController(rootViewController: favouritesViewController)
    }
}
