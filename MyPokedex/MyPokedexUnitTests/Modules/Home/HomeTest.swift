//
//  HomeTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 13/3/22.
//

import XCTest
@testable import MyPokedex

class HomeTest: XCTestCase {

    var window: UIWindow!
    var vc: HomeViewController!
    var presenter: HomePresenter!
    var interactor: HomeInteractor!
    var router: HomeRouter!
    
    var coordinator: HomeCoordinator!
    var container: MockDependencyFactory!
    
    override func setUpWithError() throws {
        window = UIWindow()
        container = MockDependencyFactory()
        coordinator = HomeCoordinator(container: container)
    }

    override func tearDownWithError() throws {
        window = nil
        vc = nil
        presenter = nil
        interactor = nil
        router = nil
        container = nil
        coordinator = nil
    }
    
    private func buildTestingScenario() {
        vc = HomeRouter.create(coordinator: coordinator) as? HomeViewController
        presenter = vc.presenter as? HomePresenter
        interactor = presenter.interactor as? HomeInteractor
        router = presenter.router as? HomeRouter
        
        window.addSubview(vc.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given a testing scenario
        buildTestingScenario()
        
        // When the view did load
        vc.loadViewIfNeeded()
        
        // Then the view has loaded the table items correctly
        
        // 0. Pokémon cell
        let pokemon = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! HomeItemTableViewCell
        XCTAssertEqual(pokemon.titleLabel.text, "Pokémon")
        XCTAssertEqual(pokemon.descriptionLabel.text, "All about pokémons")
        XCTAssertEqual(pokemon.containerImageView.image, ImageAsset.Home.pokemon.image)
        
        // 0. Games cell
        let games = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! HomeItemTableViewCell
        XCTAssertEqual(games.titleLabel.text, "Games")
        XCTAssertEqual(games.descriptionLabel.text, "In progress...")
        XCTAssertEqual(games.containerImageView.image, ImageAsset.Home.games.image)
        
        // 0. Locations cell
        let locations = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 2, section: 0)) as! HomeItemTableViewCell
        XCTAssertEqual(locations.titleLabel.text, "Locations")
        XCTAssertEqual(locations.descriptionLabel.text, "In progress...")
        XCTAssertEqual(locations.containerImageView.image, ImageAsset.Home.locations.image)
    }
}
