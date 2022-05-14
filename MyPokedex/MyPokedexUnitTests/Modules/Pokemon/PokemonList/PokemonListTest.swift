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
    
    var dataProvider: MockPokemonListLoaderUseCase!
    
    override func setUpWithError() throws {
        window = UIWindow()
        dataProvider = MockPokemonListLoaderUseCase()
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
        vc = MockPokemonListRouter.create(coordinator: nil, dataProvider: dataProvider) as? PokemonListViewController
        presenter = vc.presenter as? PokemonListPresenter
        interactor = presenter.interactor as? PokemonListInteractor
        router = presenter.router as? MockPokemonListRouter
        
        window.addSubview(vc.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given a testing scenario with one item as a result
        dataProvider.originalList = [MockPokemonListItemModel.item]
        dataProvider.image = ImageAsset.PokemonList.fallback.image
        buildTestingScenario()
        
        // When the view did load
        vc.loadViewIfNeeded()
        
        // Then the view has loaded the table item correctly
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PokemonListItemTableViewCell
        XCTAssertEqual(cell.itemNumberLabel.text, MockPokemonListItemModel.item.displayNumber)
        XCTAssertEqual(cell.itemNameLabel.text, MockPokemonListItemModel.item.displayName)
        XCTAssertEqual(cell.itemImageView.image, ImageAsset.PokemonList.fallback.image)
    }
    
    func test_didSelectRowAt() throws {
        // Given a testing scenario with one item as a result
        dataProvider.originalList = [MockPokemonListItemModel.item]
        dataProvider.image = ImageAsset.PokemonList.fallback.image
        buildTestingScenario()
        vc.loadViewIfNeeded()
        
        // When the item is selected
        vc.tableView(vc.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Then the detail view is pushed
        XCTAssertEqual(router.pushToItemDetail, MockPokemonListItemModel.item)
    }
}

class MockPokemonListRouter: PokemonListPresenterToRouterProtocol {
    
    var pushToItemDetail: PokemonListItemModel?
    
    static func create(coordinator: HomeCoordinator?, dataProvider: PokemonListLoaderUseCase?) -> UIViewController {
        let view = PokemonListViewController()
        let presenter = PokemonListPresenter()
        let interactor = PokemonListInteractor()
        let router = MockPokemonListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.imageProvider = dataProvider
        interactor.dataProvider = dataProvider
        
        return view
    }
    
    func pushToDetail(item: PokemonListItemModel?) {
        pushToItemDetail = item
    }
}
