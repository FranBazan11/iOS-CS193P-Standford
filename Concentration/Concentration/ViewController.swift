//
//  ViewController.swift
//  Concentration
//
//  Created by francisco bazan on 9/25/20.
//  Copyright © 2020 Juan Francisco Bazán Carrizo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationModel(numberOfPairsOfCards: (cardButtons.count + 1 / 2))
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chose carwas not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
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
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColor.white
        }
    }
    
    var emojiChoices = ["😈","💩","👽","💀","👹","🎃","🤖","👾","👻"]
    
    var emojiDict = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emojiDict[card.id] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDict[card.id] = emojiChoices.remove(at: randomIndex)
        }
        return emojiDict[card.id] ?? "?"
    }
}

