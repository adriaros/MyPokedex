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
    
    func start() {
        let profileViewController = ProfileRouter.create()
        navigationController = UINavigationController(rootViewController: profileViewController)
    }
}
