//
//  Array+Only.swift
//  Memorise
//
//  Created by Ram Mohan Kande on 08/10/20.
//  Copyright © 2020 TataElxsi. All rights reserved.
//

import Foundation

extension Array{
    var only:Element?{
        count == 1 ? first:nil
    }
}
