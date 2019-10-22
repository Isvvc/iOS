//
//  User.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let id: UUID
    let familyNameID: String
    let username: String
    let name: String
    let password: String
    let role: [Child]
}

struct Child {
    let username: String
    let name: String
    let password: String
    let familyNameID: String
    var pointsEarned: Int
    var chores: [Chore]
}

//struct Chore {
//    var icon: String
//    var label: String
//    var pointValue: Int
//    var completed: Bool
//}
