//
//  Array+Identifiable.swift
//  Memorise
//
//  Created by Ram Mohan Kande on 08/10/20.
//  Copyright © 2020 TataElxsi. All rights reserved.
//

import Foundation

extension Array where Element:Identifiable{
    
    func firstIndex(matiching:Element) -> Int? {
        for index in 0..<self.count{
            if self[index].id == matiching.id{
                return index
            }
        }
        return nil
    }
}
