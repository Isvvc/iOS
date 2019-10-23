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
        guard let icon = choreIcon,
            let label = choreLabel else { return nil }

        return ChoreRepresentation(choreIcon: icon, choreName: label, chorePointValue: chorePointValue, choreCompleted: choreCompleted, choreId: choreId)
    }

    convenience init(choreIcon: String, choreLabel: String, chorePointValue: Int16, choreCompleted: Bool, context: NSManagedObjectContext) {
        self.init(context: context)
        self.choreIcon = choreIcon
        self.choreLabel = choreLabel
        self.chorePointValue = chorePointValue
        self.choreCompleted = choreCompleted
    }
    
    @discardableResult convenience init?(choreRepresentation: ChoreRepresentation, context: NSManagedObjectContext) {
        self.init(choreIcon: choreRepresentation.choreIcon ?? "",
                  choreLabel: choreRepresentation.choreName,
                  chorePointValue: choreRepresentation.chorePointValue,
                  choreCompleted: choreRepresentation.choreCompleted ?? false,
                  context: context)
    }
}
