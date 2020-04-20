//
//  ViewModel.swift
//  BlackJack
//
//  Created by mcs on 4/8/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import UIKit

class ViewModel {
    weak var view: MainView?
    var deckSize: Int = 52
    
    func generateDeck() {
        let suites = ["C", "S", "H", "D"]
        var suitesIndex = -1
        
        for x in 0..<52 {
            let cardNumber = (x % 13) + 2
            if cardNumber == 2 {
                suitesIndex += 1
            }
            
            view!.deck.append(Card(suite: Suite.init(rawValue: suites[suitesIndex])!, number: cardNumber))
        }
    }
    
    func generateChips(cashAmount: Int) -> [Chip] {
        var chips = [Chip]()
        let hunnids = cashAmount / 100
        let fifties = (cashAmount % 100) / 50
        let quarters = ((cashAmount % 100) % 50) / 25
        let nickels = (((cashAmount % 100) % 50) % 25) / 5
        
        chips.append(Chip(denom: .hundo, quantity: hunnids))
        chips.append(Chip(denom: .fifty, quantity: fifties))
        chips.append(Chip(denom: .quarter, quantity: quarters))
        chips.append(Chip(denom: .nickel, quantity: nickels))
        
        return chips
    }
    
    func drawCards() -> ([Card], [Card]) {
        var dealer = [Card]()
        dealer.append((view?.deck.remove(at: Int.random(in: 0..<deckSize)))!)
        deckSize -= 1
        dealer.append((view?.deck.remove(at: Int.random(in: 0..<deckSize)))!)
        deckSize -= 1
        
        var player = [Card]()
        player.append((view?.deck.remove(at: Int.random(in: 0..<deckSize)))!)
        deckSize -= 1
        player.append((view?.deck.remove(at: Int.random(in: 0..<deckSize)))!)
        deckSize -= 1
        
        return (dealer, player)
    }
    
    func presentOptions() {
        
    }
}
