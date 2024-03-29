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
    var rootViewController: TabBarController
    var container: DependencyFactory & ViewControllerFactory
    
    override init() {
        container = DependencyContainer()
        rootViewController = container.makeTabBar()
        coordinator = MainCoordinator(tabBarController: rootViewController, container: container)
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
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
