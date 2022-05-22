//
//  GameListInteractor.swift
//  MyPokedex
//
//  Created by Adrià Ros on 22/5/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift

class GameListInteractor: GameListPresenterToInteractorProtocol {
    
    var presenter: GameListInteractorToPresenterProtocol?
    var dataProvider: GameCloudRepository?
    let disposeBag = DisposeBag()
    
    func loadData() {
        _ = dataProvider?.getVersionList()
            .subscribe(onNext: { items in
                print("AQUI: ", items as Any)
            }, onError: { _ in
            }, onCompleted: {
                
            }, onDisposed: {
                
            })
            .disposed(by: disposeBag)
    }
}
