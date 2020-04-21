//
//  ViewController.swift
//  BlackJack
//
//  Created by mcs on 3/22/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let loginView = LoginView()
    let mainView = MainView()
    var realmDB: Realm!
    
    /**
        TODO:
            - finish UI
            - download chip images
            - show dealer hand w one facing down
     */

    override func viewDidLoad() {
        super.viewDidLoad()

        view = loginView
        loginView.controller = self
    }
    
    func loadMainScreen(profile: Profile) {
        do {
            realmDB = try! Realm()
            
            let profiles = realmDB.objects(Profile.self).filter("username == '\(profile.username)'")
            if profiles.count == 0 {
                try realmDB.write {
                    realmDB.add(profile)
                    mainView.profile = profile
                }
            } else {
                mainView.profile = profiles.first!
            }
        } catch {
            print(error.localizedDescription)
        }
        
        view = mainView
        mainView.controller = self
    }
}
