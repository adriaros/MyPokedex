//
//  MockGameRepository.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/6/22.
//

import Foundation
import RxSwift
@testable import MyPokedex

class MockGameRepository: GameCloudRepository {
    
    var mockVersionList: Observable<[GameListItem]>!
    
    func getVersionList() -> Observable<[GameListItem]> {
        mockVersionList
    }
}
