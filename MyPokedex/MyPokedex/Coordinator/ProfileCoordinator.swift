//
//  ProfileCoordinator.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    let container: DependencyFactory
    
    init(container: DependencyFactory) {
        self.container = container
    }
    
    func start() {
        let profileViewController = container.makeProfile()
        navigationController = UINavigationController(rootViewController: profileViewController)
    }
}
