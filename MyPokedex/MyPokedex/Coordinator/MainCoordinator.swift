//
//  MainCoordinator.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    let window: UIWindow?
    let tabBarController: TabBarController!
    
    init(window: UIWindow?, tabBarController: TabBarController) {
        self.window = window
        self.tabBarController = tabBarController
    }
    
    func start() {
        
        let rootViewController = UIViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .red
        
        let favouritesViewController = UIViewController()
        favouritesViewController.view.backgroundColor = .blue
        
        let profileViewController = UIViewController()
        profileViewController.view.backgroundColor = .yellow
        
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        favouritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        profileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        tabBarController.viewControllers = [homeViewController, favouritesViewController, profileViewController]
        tabBarController.modalPresentationStyle = .fullScreen
        
        rootViewController.present(tabBarController, animated: false)
    }
}
