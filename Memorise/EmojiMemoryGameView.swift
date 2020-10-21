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
        VStack{
            Grid(items: viewModel.cards, viewForItem:{ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            })
                
                .padding()
                .foregroundColor(Color.orange)
            
            Button(action: {
                self.viewModel.resetGame()
            }, label: {Text("New Game")})
        }
    }
}

struct CardView:View {
    var card:MemoryGame<String>.Card
    
    var body:some View{
        
        GeometryReader { geometry   in
            self.zBody(for: geometry.size)
        }
        
        
    }
    
    @ViewBuilder
    private func zBody(for size:CGSize) -> some View {
        
        if (card.isFaceUp || !card.isMatched) {
            
            return ZStack  {
                
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5)
                    .opacity(0.7)
                
                Text(card.content).font(Font.system(size: fontSize(for: size)))
                //                .rotationEffect(Angle.degrees(card.isMatched ? 360:0))
                //                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                
            }.cardify(isFaceUp: card.isFaceUp)
        }
        
    }
    
    //MARK: Drawing constants
    
    func fontSize(for size:CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
