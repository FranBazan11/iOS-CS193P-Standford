//
//  ConcentrationModel.swift
//  ConcentrationModel
//
//  Created by Juan Francisco Bazán Carrizo on 10/6/20.
//  Copyright © 2020 Juan Francisco Bazán Carrizo. All rights reserved.
//

import Foundation

class ConcentrationModel {
    private (set) var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = ( index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "ConcentrationModel.chooseCard(at: \(index)): choose index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check inf cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "ConcentrationModel.chooseCard(at: \(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 0 ..< numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
