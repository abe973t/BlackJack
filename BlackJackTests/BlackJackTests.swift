//
//  BlackJackTests.swift
//  BlackJackTests
//
//  Created by mcs on 3/22/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import XCTest
@testable import BlackJack

class BlackJackTests: XCTestCase {
    
    var viewModel: ViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewModel = ViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        viewModel = nil
    }

    func testCreateChips() {
        let chips = [
            Chip(denom: .hundo, quantity: 12),
            Chip(denom: .fifty, quantity: 1),
            Chip(denom: .quarter, quantity: 0),
            Chip(denom: .nickel, quantity: 1)
        ]
        
        let chips2cash = viewModel.generateChips(cashAmount: 1255)
        
        XCTAssertEqual(chips, chips2cash)
    }
    
    func testGenerateDeck() {
        XCTAssertEqual(viewModel.deck.count, viewModel.deckSize)
    }
    
    func testDrawCards() {
        let cards = viewModel.drawCards()
        XCTAssertNotNil(cards)
        XCTAssert(cards.0.count == 2)
        XCTAssert(cards.1.count == 2)
        
        // (deck = 52) - (cardsDrawnForFirstPlay = 4)
        XCTAssert(viewModel.deck.count == 48, "Deck size = \(viewModel.deck.count)")
    }
}
