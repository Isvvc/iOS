//
//  AssignmentController.swift
//  Home Chore Tracker
//
//  Created by Isaac Lyons on 10/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import CoreData

class AssignmentController {
    
    let baseURL = URL(string: "https://home-chore-tracker88.herokuapp.com")!
    
    func fetchAssignmentsFromServer(userId: Int16, completion: @escaping () -> Void = { }) {
        
        let requestURL = baseURL
        .appendingPathComponent("api")
        .appendingPathComponent("assign")
        .appendingPathComponent("chores")
        .appendingPathComponent("user")
        .appendingPathComponent("\(userId)")
        
        let request = URLRequest(url: requestURL)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                NSLog("Error fetching tasks: \(error)")
                completion()
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from task fetch data task")
                completion()
                return
            }
            
            do {
                let assignments = try JSONDecoder().decode([AssignmentRepresentation].self, from: data)
                self.updateAssignments(with: assignments)
            } catch {
                NSLog("Error decoding AssignmentRepresentations: \(error)")
            }
            
            completion()
        }.resume()
    }
    
    func updateAssignments(with representations: [AssignmentRepresentation]) {
        
        let namesToFetch = representations.map({ $0.choreName })
        
        let representationsByName = Dictionary(uniqueKeysWithValues: zip(namesToFetch, representations))
        
        var assignmentsToCreate = representationsByName
        let context = CoreDataStack.shared.container.newBackgroundContext()
        
        context.performAndWait {
            do {
                
                let fetchRequest: NSFetchRequest<Assignment> = Assignment.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "choreName IN %@", namesToFetch)
                
                let existingAssignments = try context.fetch(fetchRequest)
                
                for assignment in existingAssignments {
                    guard let name = assignment.choreName,
                        let representation = representationsByName[name] else { continue }
                    
                    assignment.chorePointValue = representation.chorePointValue
                    assignment.completed = representation.completed
                    assignment.notes = representation.notes
                    
                    assignmentsToCreate.removeValue(forKey: name)
                }
                
                for representation in assignmentsToCreate.values {
                    Assignment(assignmentRepresentation: representation, context: context)
                }
                
                CoreDataStack.shared.save(context: context)
            } catch {
                NSLog("Error fetching assignments from persistent store: \(error)")
            }
        }
    }
    
}
