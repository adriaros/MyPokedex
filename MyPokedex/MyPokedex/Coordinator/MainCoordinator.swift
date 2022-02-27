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
    var navigationController: UINavigationController
    
    let window: UIWindow?
    let tabBarController: TabBarController!
    
    init(window: UIWindow?, tabBarController: TabBarController) {
        self.window = window
        self.tabBarController = tabBarController
        self.navigationController = UINavigationController()
    }
    
    func start() {
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .systemBackground
        
        let favouritesViewController = UIViewController()
        favouritesViewController.view.backgroundColor = .systemBackground
        
        let profileViewController = UIViewController()
        profileViewController.view.backgroundColor = .systemBackground
        
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        favouritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        profileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        tabBarController.viewControllers = [homeViewController, favouritesViewController, profileViewController]
        tabBarController.modalPresentationStyle = .fullScreen
        
        navigationController.present(tabBarController, animated: false)
    }
}
