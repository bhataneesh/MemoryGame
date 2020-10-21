//
//  Cardify.swift
//  Memorise
//
//  Created by Ram Mohan Kande on 19/10/20.
//  Copyright © 2020 TataElxsi. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier{
    
    var isFaceUp: Bool
    
    let cornerRadius:CGFloat = 10.0
    let edgeLineWidth:CGFloat = 3.0
    
    func body(content: Content) -> some View{
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)
                content
            }
            else{
                RoundedRectangle(cornerRadius: self.cornerRadius).fill()
            }
        }
    }
}


extension View{
    
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
