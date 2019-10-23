//
//  ChoreController.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData
import Alamofire

class ChoreController {
    
    init() {
        
    }
    
    #warning("Change the baseURL")
//    let baseURL = URL(string: "https://home-chore-tracker88.herokuapp.com")
    let baseURL = URL(string: "https://e7d8a490.ngrok.io")?.absoluteString
    
    func getAllChores(completion: @escaping ([Chore]?) -> Void) {
        guard let baseURL = baseURL else { return }
        AF.request("\(baseURL)/chores").validate().responseJSON { response in
            guard let data = response.data else {
                print("No data returned from response.")
                completion(nil)
                return
            }
            do {
                let decoder = JSONDecoder()
                let choreRepresentations = try decoder.decode([ChoreRepresentation].self, from: data)
                self.updateChores(with: choreRepresentations)
            } catch {
                NSLog("Error decoding: \(error)")
            }
            completion(nil)
            debugPrint("Response: \(response)")
        }
    }
    
    func updateChores(with representations: [ChoreRepresentation]) {
        let labelsToFetch = representations.compactMap({ $0.label })
        let representationsByLabel = Dictionary(uniqueKeysWithValues: zip(labelsToFetch, representations))
        var choresToCreate = representationsByLabel
        let context = CoreDataStack.shared.container.newBackgroundContext()
        
        context.performAndWait {
            do {
                let fetchRequest: NSFetchRequest<Chore> = Chore.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "label IN %@", labelsToFetch)
                let existingChores = try context.fetch(fetchRequest)
                for chore in existingChores {
                    guard let label = chore.label,
                    let representation = representationsByLabel[label] else { continue }
                    chore.label = representation.label
                    chore.icon = representation.icon
                    chore.pointValue = Int16(representation.pointValue)
                    chore.completed = representation.completed
                    choresToCreate.removeValue(forKey: label)
                }
                for representation in choresToCreate.values {
                        Chore(choreRepresentation: representation, context: context)
                    }
                    CoreDataStack.shared.save(context: context)
            } catch {
                NSLog("Error fetching chores from persistent store: \(error)")
            }
        }
    }
    
    func updateChore(chore: Chore, completed: Bool) {
        guard let icon = chore.icon,
            let label = chore.label else { return }
        chore.completed = completed
        let choreRep = ChoreRepresentation(icon: icon, label: label, pointValue: chore.pointValue, completed: chore.completed)
        guard let baseURL = baseURL else { return }
        AF.request("\(baseURL)/chores", method: .put, parameters: choreRep, encoder: JSONParameterEncoder.default).validate().response { response in
                debugPrint(response)
                CoreDataStack.shared.save()
        }
    }
}
