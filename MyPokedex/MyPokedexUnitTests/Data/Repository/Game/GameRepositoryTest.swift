//
//  GameRepositoryTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 21/5/22.
//

import XCTest
import RxTest
import RxSwift
@testable import MyPokedex

class GameRepositoryTest: XCTestCase {
    
    var sut: GameRepository!
    var networkManager: MockNetworkManager!
    var networkResponses: MockGameApiResponses!
    
    private var scheduler: TestScheduler!
    private var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        networkManager = MockNetworkManager()
        sut = GameRepository(network: networkManager)
        networkResponses = MockGameApiResponses()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        sut = nil
        networkManager = nil
    }

    func test_getOriginalList() throws {
        // Given the data to be subscribed
        let dataSubject = PublishSubject<Data?>()
        networkManager.mockObservableData = dataSubject

        // Given the expected results from the get method
        let countOfGames = sut.getVersionList().map({ $0.count })
        let firstGame = sut.getVersionList().map({ $0.first?.name })

        // When the observable is created
        scheduler
            .createColdObservable([.next(1, networkResponses.getVersionList)])
            .bind(to: dataSubject)
            .disposed(by: disposeBag)

        let countResult = scheduler.record(countOfGames, disposeBag: self.disposeBag)
        let firstGameResult = scheduler.record(firstGame, disposeBag: self.disposeBag)
        
        scheduler.start()
        
        // Then the data is obtained
        XCTAssertEqual(countResult.events, [.next(1, 34), .completed(1)])
        XCTAssertEqual(firstGameResult.events, [.next(1, "red"), .completed(1)])
    }
}
