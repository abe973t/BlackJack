//
//  Play.swift
//  BlackJack
//
//  Created by mcs on 4/7/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import Foundation
import RealmSwift

enum Suite {
    case Club
    case Spades
    case Hearts
    case Diamonds
}

struct Card {
    let suite: Suite
    let number: Int
}

class Play: Object {
    let dealerHand: [Card] = []
    let playerHand: [Card] = []
    let moneyWon: Int = 0
    let moneyBet: Int = 0
    let timeStamp: Date = Date()
}
