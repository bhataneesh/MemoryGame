//
//  MemoryGame.swift
//  Memorise
//
//  Created by Ram Mohan Kande on 01/10/20.
//  Copyright © 2020 TataElxsi. All rights reserved.
//

// MODEL


import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    
    private(set) var cards:Array<Card>
    
    var indexOfTheOneAndOnlyFaceCard: Int?{
        get{
            return cards.indices.filter {cards[$0].isFaceUp}.only
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card:Card){
        if let choosenIndex = cards.firstIndex(matiching: card), !cards[choosenIndex].isFaceUp,!cards[choosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceCard{
                if cards[choosenIndex].content == cards[potentialMatchIndex].content{
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                   indexOfTheOneAndOnlyFaceCard = nil
            } else{
                    for index in cards.indices{
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceCard = choosenIndex
                }
            self.cards[choosenIndex].isFaceUp = true
        }
    }
    

    
    init(numberOfPairsOfCards:Int, cardContentFactory:(Int)->CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))

        }
    }
    struct Card:Identifiable {

        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
        var id:Int
    }
}
