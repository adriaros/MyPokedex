//
//  SceneDelegate.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator
    var rootViewController: UIViewController
    
    override init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        rootViewController = UIViewController()
        coordinator = MainCoordinator(rootViewController: rootViewController, tabBarController: TabBarController())
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        
        let favouritesCoordinator = FavouritesCoordinator()
        favouritesCoordinator.start()
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.start()
        
        coordinator.childCoordinators = [homeCoordinator, favouritesCoordinator, profileCoordinator]
        coordinator.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}
