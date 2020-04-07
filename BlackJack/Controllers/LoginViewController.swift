//
//  LoginViewController.swift
//  BlackJack
//
//  Created by mcs on 3/22/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view = loginView
    }
    
}
