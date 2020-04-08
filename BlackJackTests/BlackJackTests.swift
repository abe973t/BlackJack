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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
