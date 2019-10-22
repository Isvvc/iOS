//
//  UserRepresentation.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct UserRepresentation: Codable {
    let id: UUID
    let familyNameID: String
    let username: String
    let name: String
    let password: String
    let role: [ChildRepresentation]
}

struct ChildRepresentation: Codable {
    let username: String
    let name: String
    let password: String
    let familyNameID: String
    var pointsEarned: Int
    var chores: [ChoreRepresentation]
}

struct ChoreRepresentation: Codable {
    var icon: String
    var label: String
    var pointValue: Int
    var completed: Bool
}
