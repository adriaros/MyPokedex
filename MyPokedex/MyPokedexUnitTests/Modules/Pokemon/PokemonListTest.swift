//
//  PokemonListTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 26/3/22.
//

import XCTest
@testable import MyPokedex

class PokemonListTest: XCTestCase {

    var window: UIWindow!
    var vc: PokemonListViewController!
    var presenter: PokemonListPresenter!
    var interactor: PokemonListInteractor!
    var router: MockPokemonListRouter!
    
    override func setUpWithError() throws {
        window = UIWindow()
    }

    override func tearDownWithError() throws {
        window = nil
        vc = nil
        presenter = nil
        interactor = nil
        router = nil
    }
    
    private func buildTestingScenario() {
        vc = MockPokemonListRouter.create(dataProvider: nil) as? PokemonListViewController
        presenter = vc.presenter as? PokemonListPresenter
        interactor = presenter.interactor as? PokemonListInteractor
        router = presenter.router as? MockPokemonListRouter
        
        window.addSubview(vc.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given a testing scenario
        buildTestingScenario()
        
        // When the view did load
        vc.loadViewIfNeeded()
        
        // Then the view has loaded the table items correctly
        
        // Pokémon cell
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PokemonListItemTableViewCell
        XCTAssertEqual(cell.itemNumberLabel.text, "#1")
        XCTAssertEqual(cell.itemNameLabel.text, "Bulbasaur")
    }
}

class MockPokemonListRouter: PokemonListPresenterToRouterProtocol {
    
    static func create(dataProvider: PokemonListUseCase?) -> UIViewController {
        let view = PokemonListViewController()
        let presenter = PokemonListPresenter()
        let interactor = PokemonListInteractor()
        let router = MockPokemonListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        interactor.dataProvider = dataProvider
        
        return view
    }
}
