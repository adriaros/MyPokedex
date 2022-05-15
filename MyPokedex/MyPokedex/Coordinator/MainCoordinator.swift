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
    let container: ViewControllerFactory
    
    init(tabBarController: TabBarController, container: ViewControllerFactory) {
        self.tabBarController = tabBarController
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
            fatalError("Fatal error. Home navigation controller does not exist. Tab Bar controller can not be constructed")
        }
        
        home.tabBarItem = UITabBarItem(title: "Home", image: ImageAsset.TabBar.base.image, selectedImage: ImageAsset.TabBar.selected.image)
        home.tabBarItem.tag = 0
        
        guard let favourites = childCoordinators[1].navigationController else {
            fatalError("Fatal error. Favourites navigation controller does not exist. Tab Bar controller can not be constructed")
        }
        
        favourites.tabBarItem = UITabBarItem(title: "Favourites", image: ImageAsset.TabBar.base.image, selectedImage: ImageAsset.TabBar.selected.image)
        favourites.tabBarItem.tag = 1
        
        guard let profile = childCoordinators[2].navigationController else {
            fatalError("Fatal error. Profile navigation controller does not exist. Tab Bar controller can not be constructed")
        }
        
        profile.tabBarItem = UITabBarItem(title: "Profile", image: ImageAsset.TabBar.base.image, selectedImage: ImageAsset.TabBar.selected.image)
        profile.tabBarItem.tag = 2
        
        tabBarController.viewControllers = [home, favourites, profile]
        tabBarController.modalPresentationStyle = .fullScreen
    }
}
