//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Ram Mohan Kande on 01/10/20.
//  Copyright © 2020 TataElxsi. All rights reserved.
//

// VIEWMODEL

import Foundation

class EmojiMemoryGame:ObservableObject {
    
  @Published private var model:MemoryGame<String> = createMemoryGame()   //Observable property wraper 
    
   private static func createMemoryGame() -> MemoryGame<String> {
        
        let emojis : Array<String> = ["👻","🎃","🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: { (pairIndex) -> String in
            return emojis[pairIndex]
        })
    }
    
    //MARK: Access to the model
    var cards:Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
   //MARK: Intent(s)
    func choose(card:MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame()  {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
