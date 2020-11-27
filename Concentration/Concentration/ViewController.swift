//
//  ViewController.swift
//  Concentration
//
//  Created by francisco bazan on 9/25/20.
//  Copyright © 2020 Juan Francisco Bazán Carrizo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationModel(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak  var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chose carwas not in cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["😈","💩","👽","💀","👹","🎃","🤖","👾","👻"]
    
    private var emojiDict = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emojiDict[card.id] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDict[card.id] = emojiChoices.remove(at: randomIndex)
        }
        return emojiDict[card.id] ?? "?"
    }
}
