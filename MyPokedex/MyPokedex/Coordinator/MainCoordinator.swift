//
//  MainCoordinator.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    let tabBarController: TabBarController
    let rootViewController: UIViewController
    let container: Factory
    
    init(rootViewController: UIViewController, tabBarController: TabBarController, container: Factory) {
        self.tabBarController = tabBarController
        self.rootViewController = rootViewController
        self.container = container
    }
    
    func start() {
        
        let homeCoordinator = HomeCoordinator(container: container)
        homeCoordinator.start()
        
        let favouritesCoordinator = FavouritesCoordinator(container: container)
        favouritesCoordinator.start()
        
        let profileCoordinator = ProfileCoordinator(container: container)
        profileCoordinator.start()
        
        childCoordinators = [homeCoordinator, favouritesCoordinator, profileCoordinator]
        
        guard let home = childCoordinators[0].navigationController else {
            return
        }
        
        home.tabBarItem = UITabBarItem(title: "Home", image: ImageAsset.TabBar.home.image, tag: 0)
        
        guard let favourites = childCoordinators[1].navigationController else {
            return
        }
        
        favourites.tabBarItem = UITabBarItem(title: "Favourites", image: ImageAsset.TabBar.home.image, tag: 1)
        
        guard let profile = childCoordinators[2].navigationController else {
            return
        }
        
        profile.tabBarItem = UITabBarItem(title: "Profile", image: ImageAsset.TabBar.home.image, tag: 2)
        
        tabBarController.viewControllers = [home, favourites, profile]
        tabBarController.modalPresentationStyle = .fullScreen
        
        rootViewController.present(tabBarController, animated: false)
    }
}
