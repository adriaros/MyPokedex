//
//  GameListTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/6/22.
//

import XCTest
import RxSwift
import RxTest
@testable import MyPokedex

class GameListTest: XCTestCase {

    var window: UIWindow!
    var vc: GameListViewController!
    var presenter: GameListPresenter!
    var interactor: GameListInteractor!
    var router: MockGameListRouter!
    
    var dataProvider: MockGameRepository!
    
    private var scheduler: TestScheduler!
    private var disposeBag: DisposeBag!
        
    override func setUpWithError() throws {
        window = UIWindow()
        dataProvider = MockGameRepository()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
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
        vc = MockGameListRouter.createModule(coordinator: nil, dataProvider: dataProvider) as? GameListViewController
        presenter = vc.presenter as? GameListPresenter
        interactor = presenter.interactor as? GameListInteractor
        router = presenter.router as? MockGameListRouter
        
        window.addSubview(vc.view)
        window.makeKeyAndVisible()
    }

    func test_viewDidLoad() throws {
        // Given the data to be subscribed
        let dataSubject = PublishSubject<[GameListItem]>()
        dataProvider.mockVersionList = dataSubject
        
        // Given a testing scenario with one item as a result
        buildTestingScenario()
        
        // When the view did load
        vc.loadViewIfNeeded()
        
        // When the observable is created
        scheduler
            .createColdObservable([.next(1, [MockGameListItem.item])])
            .bind(to: dataSubject)
            .disposed(by: disposeBag)

        scheduler.start()
        
        // Then the view has loaded the table item correctly
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! GameListItemTableViewCell
        XCTAssertEqual(cell.itemNameLabel.text, MockGameListItem.item.name)
    }
}

class MockGameListRouter: GameListPresenterToRouterProtocol {
    
    var pushToItemDetail: GameListItem?
    
    static func createModule(coordinator: HomeCoordinator?, dataProvider: GameCloudRepository) -> UIViewController {
        let view = GameListViewController()
        let presenter = GameListPresenter()
        let interactor = GameListInteractor()
        let router = MockGameListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        interactor.dataProvider = dataProvider
        
        return view
    }
}
