//
//  JSONDecoder-Decodable.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/3/22.
//

import Foundation

extension JSONDecoder {
    
    func decode<T: Decodable>(data: Data?) -> T? {
        
        guard let data = data else {
            return nil
        }
        
        guard let decodedData = try? self.decode(T.self, from: data) else {
            return nil
        }
        
        return decodedData
    }
}
