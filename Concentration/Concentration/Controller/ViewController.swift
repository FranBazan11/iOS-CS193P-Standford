//
//  ViewController.swift
//  Concentration
//
//  Created by francisco bazan on 9/25/20.
//  Copyright © 2020 Juan Francisco Bazán Carrizo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var game = ConcentrationModel(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var emojiChoices = "😈💩👽💀👹🎃🤖👾👻"
    
    private var emoji = [Card: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
    private var numberOfPairsOfCards: Int {
            return (cardButtons.count) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes : [NSAttributedString.Key : Any] = [
            .strokeWidth : 5,
            .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1),
        ]
        
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
    
        flipCountLabel.attributedText = attributedString
    }
    
    @IBOutlet private weak  var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
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
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
//    private var emojiChoices = ["😈","💩","👽","💀","👹","🎃","🤖","👾","👻"]
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
