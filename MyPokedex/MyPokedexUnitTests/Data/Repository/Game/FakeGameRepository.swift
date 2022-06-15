//
//  FakeGameRepository.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/6/22.
//

import Foundation
import RxSwift
@testable import MyPokedex

class FakeGameRepository: GameCloudRepository {
    
    var mockVersionList: Observable<[GameListItem]>!
    
    func getVersionList() -> Observable<[GameListItem]> {
        mockVersionList
    }
}
