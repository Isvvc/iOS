//
//  ChildRepresentation.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ChildRepresentation: Codable {
    let username: String
    let name: String
    let password: String
    let familyNameID: String
    var pointsEarned: Int
    var chores: [ChoreRepresentation]
}
