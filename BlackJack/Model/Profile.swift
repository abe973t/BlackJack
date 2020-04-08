//
//  Profile.swift
//  BlackJack
//
//  Created by mcs on 4/7/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import Foundation
import RealmSwift

class Profile: Object {
    @objc dynamic var username: String = ""
    @objc dynamic var numOfBJs: Int = 0
    @objc dynamic var cash: Int = 0
}
