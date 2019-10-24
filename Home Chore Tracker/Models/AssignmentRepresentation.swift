//
//  AssignmentRepresentation.swift
//  Home Chore Tracker
//
//  Created by Isaac Lyons on 10/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct AssignmentRepresentation: Codable {
    var choreName: String
    var chorePointValue: Int16
    var completed: Int16
    var notes: String?
}
