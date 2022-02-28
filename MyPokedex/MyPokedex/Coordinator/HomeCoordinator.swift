//
//  HomeCoordinator.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    func start() {
        let homeViewController = HomeRouter.create(coordinator: self)
        navigationController = UINavigationController(rootViewController: homeViewController)
    }
    
    func pushToDetail(animated: Bool) {
        let detailViewController = DetailRouter.create()
        navigationController?.pushViewController(detailViewController, animated: animated)
    }
    
    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}
