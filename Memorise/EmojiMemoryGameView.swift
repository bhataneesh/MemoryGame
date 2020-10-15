//
//  ContentView.swift
//  Memorise
//
//  Created by Ram Mohan Kande on 29/09/20.
//  Copyright © 2020 TataElxsi. All rights reserved.
//

import SwiftUI

//View
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    
    var body: some View {
              Grid(items: viewModel.cards, viewForItem:{ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
              .padding(5)
            })
        
            .padding()
            .foregroundColor(Color.orange)
            .font(.largeTitle)
    }
}

struct CardView:View {
    var card:MemoryGame<String>.Card
    
    var body:some View{
        GeometryReader { geometry  in
            ZStack (content:{
                if self.card.isFaceUp{
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)
                    Text(self.card.content)
                }
                else{
                    if !self.card.isMatched{
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                    }
                }
            })
                .font(Font.system(size:self.fontSize(for: geometry.size)))
        }
    }
    
    //MARK: Drawing constants
    let cornerRadius:CGFloat = 10.0
    let edgeLineWidth:CGFloat = 3.0
    func fontSize(for size:CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
