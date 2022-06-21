//
//  FavouritesTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 21/6/22.
//

import XCTest
@testable import MyPokedex

class FavouritesTest: XCTestCase {

    var window: UIWindow!
    var vc: FavouritesViewController!
    var presenter: FavouritesPresenter!
    var interactor: FavouritesInteractor!
    var router: MockFavouritesRouter!
    
    var dataProvider: FakeFavouriteRepository!
    var imageProvider: FakeImageProviderUseCase!
    
    override func setUpWithError() throws {
        window = UIWindow()
        dataProvider = FakeFavouriteRepository()
        imageProvider = FakeImageProviderUseCase()
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
        vc = MockFavouritesRouter.create(dataProvider: dataProvider, imageProvider: imageProvider) as? FavouritesViewController
        presenter = vc.presenter as? FavouritesPresenter
        interactor = presenter.interactor as? FavouritesInteractor
        router = presenter.router as? MockFavouritesRouter
        
        window.addSubview(vc.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given a favourite
        let favourite = MockFavourite()
        favourite.stubbedId = "1"
        favourite.stubbedName = "Favourite"
        
        // Given a testing scenario with one item as a result
        dataProvider.allFavourites = [favourite]
        imageProvider.image = ImageAsset.PokemonList.fallback.image
        buildTestingScenario()
        
        // When the view did load
        vc.loadViewIfNeeded()
        
        // Then the view has loaded the table item correctly
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PokemonListItemTableViewCell
        XCTAssertEqual(cell.itemNumberLabel.text, "#1")
        XCTAssertEqual(cell.itemNameLabel.text, "Favourite")
        XCTAssertEqual(cell.itemImageView.image, ImageAsset.PokemonList.fallback.image)
    }
}

class MockFavouritesRouter: FavouritesPresenterToRouterProtocol {
    
    static func create(dataProvider: FavouriteDiskRepository, imageProvider: ImageProviderUseCase) -> UIViewController {
        let view = FavouritesViewController()
        let presenter = FavouritesPresenter()
        let interactor = FavouritesInteractor()
        let router = MockFavouritesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.imageProvider = imageProvider
        interactor.dataProvider = dataProvider
        
        return view
    }
}
