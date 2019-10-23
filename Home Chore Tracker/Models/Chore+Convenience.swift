//
//  Chore+Convenience.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.


import Foundation
import CoreData

extension Chore {
    var choreRepresentation: ChoreRepresentation? {
        guard let icon = icon,
            let label = label else { return nil }

        return ChoreRepresentation(icon: icon, label: label, pointValue: pointValue, completed: completed)
    }

    convenience init(icon: String, label: String, pointValue: Int16, completed: Bool, context: NSManagedObjectContext) {
        self.init(context: context)
        self.icon = icon
        self.label = label
        self.pointValue = pointValue
        self.completed = completed
    }
    
    @discardableResult convenience init?(choreRepresentation: ChoreRepresentation, context: NSManagedObjectContext) {
        self.init(icon: choreRepresentation.icon,
                  label: choreRepresentation.label,
                  pointValue: choreRepresentation.pointValue,
                  completed: choreRepresentation.completed,
                  context: context)
    }
}
