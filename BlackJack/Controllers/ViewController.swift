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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = loginView
        mainView.controller = self
    }
    
    func loadMainScreen(profile: Profile) {
        do {
            realmDB = try! Realm()
            
            let profile = realmDB.objects(Profile.self).filter("name == \(profile.username)")
            if profile.count == 0 {
                try realmDB.write {
                     realmDB.add(profile)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        view = mainView
        mainView.controller = self
    }
}
