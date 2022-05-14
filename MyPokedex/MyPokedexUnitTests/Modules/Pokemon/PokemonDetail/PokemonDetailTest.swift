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
    
    var dataProvider: MockPokemonRepository!
    var imageProvider: MockImageProviderUseCase!
    
    var item: PokemonListItem {
        MockPokemonListItem.item
    }
    
    var pokemon: Pokemon {
        MockPokemon.item
    }
    
    override func setUpWithError() throws {
        window = UIWindow()
        dataProvider = MockPokemonRepository()
        imageProvider = MockImageProviderUseCase()
    }

    override func tearDownWithError() throws {
        window = nil
        view = nil
        presenter = nil
        interactor = nil
        router = nil
        dataProvider = nil
        imageProvider = nil
    }
    
    private func buildTestingScenario() {
        view = MockPokemonDetailRouter.create(item: item, dataProvider: dataProvider, imageProvider: imageProvider) as? PokemonDetailViewController
        presenter = view.presenter as? PokemonDetailPresenter
        interactor = presenter.interactor as? PokemonDetailInteractor
        router = presenter.router as? MockPokemonDetailRouter
        
        window.addSubview(view.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given a testing scenario with one item as a result
        dataProvider.mockPokemon = pokemon
        imageProvider.image = ImageAsset.PokemonDetail.fallback.image
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view has loaded the table items correctly
        let imageCell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PokemonDetailImageTableViewCell
        XCTAssertEqual(imageCell.pokemonImageView.image, ImageAsset.PokemonDetail.fallback.image)
        
        let dataCell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! PokemonDetailDataTableViewCell
        XCTAssertEqual(dataCell.pokemonNameLabel.text, pokemon.displayName)
    }
}

class MockPokemonDetailRouter: PokemonDetailPresenterToRouterProtocol {
    
    static func create(item: PokemonListItem, dataProvider: PokemonCloudRepository, imageProvider: ImageProviderUseCase) -> UIViewController {
        let view = PokemonDetailViewController()
        let presenter = PokemonDetailPresenter()
        let interactor = PokemonDetailInteractor()
        let router = MockPokemonDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.imageProvider = imageProvider
        interactor.item = item
        interactor.dataProvider = dataProvider
        
        return view
    }
}
