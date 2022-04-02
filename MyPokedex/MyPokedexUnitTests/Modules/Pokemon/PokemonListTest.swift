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
    
    var dataProvider: MockGetPokemonListUseCase!
    
    override func setUpWithError() throws {
        window = UIWindow()
        dataProvider = MockGetPokemonListUseCase()
    }

    override func tearDownWithError() throws {
        window = nil
        vc = nil
        presenter = nil
        interactor = nil
        router = nil
        dataProvider = nil
    }
    
    private func buildTestingScenario() {
        vc = MockPokemonListRouter.create(dataProvider: dataProvider) as? PokemonListViewController
        presenter = vc.presenter as? PokemonListPresenter
        interactor = presenter.interactor as? PokemonListInteractor
        router = presenter.router as? MockPokemonListRouter
        
        window.addSubview(vc.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given a testing scenario with one item as a result
        dataProvider.originalList = [MockPokemonListItemModel.item]
        buildTestingScenario()
        
        // When the view did load
        vc.loadViewIfNeeded()
        
        // Then the view has loaded the table item correctly
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PokemonListItemTableViewCell
        XCTAssertEqual(cell.itemNumberLabel.text, MockPokemonListItemModel.item.displayNumber)
        XCTAssertEqual(cell.itemNameLabel.text, MockPokemonListItemModel.item.displayName)
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
