//
//  MockHomeCoordinator.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import UIKit
@testable import MyPokedex

class MockHomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    func start() {
        
    }
}
