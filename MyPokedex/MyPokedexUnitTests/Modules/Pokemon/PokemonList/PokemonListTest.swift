//
//  PokemonListTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import XCTest
@testable import MyPokedex

class PokemonListTest: XCTestCase {

    var window: UIWindow!
    var vc: PokemonListViewController!
    var presenter: PokemonListPresenter!
    var interactor: PokemonListInteractor!
    var router: MockPokemonListRouter!
    
    var dataProvider: MockPokemonRepository!
    var imageProvider: MockImageProviderUseCase!
    
    override func setUpWithError() throws {
        window = UIWindow()
        dataProvider = MockPokemonRepository()
        imageProvider = MockImageProviderUseCase()
    }

    override func tearDownWithError() throws {
        window = nil
        vc = nil
        presenter = nil
        interactor = nil
        router = nil
        dataProvider = nil
        imageProvider = nil
    }
    
    private func buildTestingScenario() {
        vc = MockPokemonListRouter.create(coordinator: nil, dataProvider: dataProvider, imageProvider: imageProvider) as? PokemonListViewController
        presenter = vc.presenter as? PokemonListPresenter
        interactor = presenter.interactor as? PokemonListInteractor
        router = presenter.router as? MockPokemonListRouter
        
        window.addSubview(vc.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given a testing scenario with one item as a result
        dataProvider.mockOriginalList = [MockPokemonListItem.item]
        imageProvider.image = ImageAsset.PokemonList.fallback.image
        buildTestingScenario()
        
        // When the view did load
        vc.loadViewIfNeeded()
        
        // Then the view has loaded the table item correctly
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PokemonListItemTableViewCell
        XCTAssertEqual(cell.itemNumberLabel.text, MockPokemonListItem.item.displayNumber)
        XCTAssertEqual(cell.itemNameLabel.text, MockPokemonListItem.item.displayName)
        XCTAssertEqual(cell.itemImageView.image, ImageAsset.PokemonList.fallback.image)
    }
    
    func test_didSelectRowAt() throws {
        // Given a testing scenario with one item as a result
        dataProvider.mockOriginalList = [MockPokemonListItem.item]
        imageProvider.image = ImageAsset.PokemonList.fallback.image
        buildTestingScenario()
        vc.loadViewIfNeeded()
        
        // When the item is selected
        vc.tableView(vc.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Then the detail view is pushed
        XCTAssertEqual(router.pushToItemDetail, MockPokemonListItem.item)
    }
}

class MockPokemonListRouter: PokemonListPresenterToRouterProtocol {
    
    var pushToItemDetail: PokemonListItem?
    
    static func create(coordinator: HomeCoordinator?, dataProvider: PokemonCloudRepository, imageProvider: ImageProviderUseCase) -> UIViewController {
        let view = PokemonListViewController()
        let presenter = PokemonListPresenter()
        let interactor = PokemonListInteractor()
        let router = MockPokemonListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.imageProvider = imageProvider
        interactor.dataProvider = dataProvider
        
        return view
    }
    
    func pushToDetail(item: PokemonListItem?) {
        pushToItemDetail = item
    }
}
