//
//  Card.swift
//  Concentration
//
//  Created by francisco bazan on 10/7/20.
//  Copyright © 2020 Juan Francisco Bazán Carrizo. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
//        self.isFaceUp = isFaceUp
//        self.isMatched = isMatched
        self.id = Card.getUniqueIdentifier()
    }
}


