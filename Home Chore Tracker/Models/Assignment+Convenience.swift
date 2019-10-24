//
//  Assignment+Convenience.swift
//  Home Chore Tracker
//
//  Created by Isaac Lyons on 10/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import CoreData

extension Assignment {
    
    var assignmentRepresentation: AssignmentRepresentation? {
        guard let choreName = choreName,
            let notes = notes else { return nil }
        
        return AssignmentRepresentation(choreName: choreName, chorePointValue: chorePointValue, completed: completed, notes: notes)
    }
    
    convenience init(choreName: String, chorePointValue: Int16, completed: Int16, notes: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.choreName = choreName
        self.chorePointValue = chorePointValue
        self.completed = completed
        self.notes = notes
    }
    
    @discardableResult convenience init?(assignmentRepresentation: AssignmentRepresentation, context: NSManagedObjectContext) {
        self.init(choreName: assignmentRepresentation.choreName,
                  chorePointValue: assignmentRepresentation.chorePointValue,
                  completed: assignmentRepresentation.completed,
                  notes: assignmentRepresentation.notes ?? "",
                  context: context)
    }
    
}
