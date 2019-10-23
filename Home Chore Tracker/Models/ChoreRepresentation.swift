//
//  ChoreRepresentation.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ChoreRepresentation: Codable {
    var icon: String
    var label: String
    var pointValue: Int16
    var completed: Bool
}
