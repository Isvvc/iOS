//
//  ChoreRepresentation.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ChoreRepresentation: Codable {
    var choreIcon: String?
    var choreName: String
    var chorePointValue: Int16
    var choreCompleted: Bool?
    var choreId: Int16
}
