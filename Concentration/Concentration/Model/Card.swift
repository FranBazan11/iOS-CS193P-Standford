//
//  Card.swift
//  Concentration
//
//  Created by francisco bazan on 10/7/20.
//  Copyright © 2020 Juan Francisco Bazán Carrizo. All rights reserved.
//

import Foundation

struct Card : Hashable {
    
    var isFaceUp = false
    var isMatched = false
    private var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.id = Card.getUniqueIdentifier()
    }
}


