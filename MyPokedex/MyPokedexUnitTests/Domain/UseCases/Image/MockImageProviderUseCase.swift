//
//  MockImageProviderUseCase.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation
import UIKit
@testable import MyPokedex

class MockImageProviderUseCase: ImageProviderUseCase {
    
    var image: UIImage?
    
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        completion(image)
    }
}
