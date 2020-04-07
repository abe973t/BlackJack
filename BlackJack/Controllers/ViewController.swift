//
//  ViewController.swift
//  BlackJack
//
//  Created by mcs on 3/22/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /**
     TODO:
        - create a Play object and store in Realm. This will had dHand, pHand, moneyWon, moneyBet, timeStamp
     */
    
    let loginView = LoginView()
    let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = loginView
        mainView.controller = self
    }
    
    func loadMainScreen() {
        view = mainView
        mainView.controller = self
    }
}

