//
//  PokemonDetailTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import XCTest
@testable import MyPokedex

class PokemonDetailTest: XCTestCase {

    var window: UIWindow!
    var view: PokemonDetailViewController!
    var presenter: PokemonDetailPresenter!
    var interactor: PokemonDetailInteractor!
    var router: MockPokemonDetailRouter!
    
    var dataProvider: MockPokemonLoaderUseCase!
    
    var item: PokemonListItem {
        MockPokemonListItem.item
    }
    
    var pokemon: Pokemon {
        MockPokemon.item
    }
    
    override func setUpWithError() throws {
        window = UIWindow()
        dataProvider = MockPokemonLoaderUseCase()
    }

    override func tearDownWithError() throws {
        window = nil
        view = nil
        presenter = nil
        interactor = nil
        router = nil
        dataProvider = nil
    }
    
    private func buildTestingScenario() {
        view = MockPokemonDetailRouter.create(item: item, dataProvider: dataProvider) as? PokemonDetailViewController
        presenter = view.presenter as? PokemonDetailPresenter
        interactor = presenter.interactor as? PokemonDetailInteractor
        router = presenter.router as? MockPokemonDetailRouter
        
        window.addSubview(view.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given a testing scenario with one item as a result
        dataProvider.pokemon = pokemon
        dataProvider.image = ImageAsset.PokemonDetail.fallback.image
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view has loaded the table items correctly
        let imageCell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PokemonDetailImageTableViewCell
        XCTAssertEqual(imageCell.pokemonImageView.image, ImageAsset.PokemonDetail.fallback.image)
    }
}

class MockPokemonDetailRouter: PokemonDetailPresenterToRouterProtocol {
    
    static func create(item: PokemonListItem, dataProvider: PokemonLoaderUseCase?) -> UIViewController {
        let view = PokemonDetailViewController()
        let presenter = PokemonDetailPresenter()
        let interactor = PokemonDetailInteractor()
        let router = MockPokemonDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.imageProvider = dataProvider
        interactor.dataProvider = dataProvider
        
        return view
    }
}
