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
    var container: Factory
    
    override init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        container = DependencyFactory()
        rootViewController = UIViewController()
        coordinator = MainCoordinator(rootViewController: rootViewController, tabBarController: TabBarController(), container: container)
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
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
