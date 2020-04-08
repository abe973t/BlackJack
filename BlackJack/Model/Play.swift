//
//  Play.swift
//  BlackJack
//
//  Created by mcs on 4/7/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import Foundation
import RealmSwift

enum Suite: String {
    case Club = "C"
    case Spades = "S"
    case Hearts = "H"
    case Diamonds = "D"
}

struct Card {
    let suite: Suite
    let number: Int
}

enum ChipDenom: Int {
    case nickel = 5
    case quarter = 25
    case fifty = 50
    case hundo = 100
}

struct Chip: Equatable {
    let denom: ChipDenom
    let value: Int
    var quantity: Int
    
    init(denom: ChipDenom, quantity: Int) {
        self.denom = denom
        value = denom.rawValue
        self.quantity = quantity
    }
}

class Play: Object {
    let dealerHand: [Card] = []
    let playerHand: [Card] = []
    let moneyWon: Int = 0
    let moneyBet: Int = 0
    let timeStamp: Date = Date()
}
