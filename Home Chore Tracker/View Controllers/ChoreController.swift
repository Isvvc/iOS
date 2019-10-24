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
        fetchChoresFromServer()
    }
    
    // MARK: - CC Networking
    
    var bearer: Bearer?
    var user: User?
    
    let baseURL = URL(string: "https://home-chore-tracker88.herokuapp.com")
    
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
    
//    func updateChores(with representations: [ChoreRepresentation]) {
//        let labelsToFetch = representations.compactMap({ $0.choreName })
//        let representationsByLabel = Dictionary(uniqueKeysWithValues: zip(labelsToFetch, representations))
//        var choresToCreate = representationsByLabel
//        let context = CoreDataStack.shared.container.newBackgroundContext()
//
//        context.performAndWait {
//            do {
//                let fetchRequest: NSFetchRequest<Chore> = Chore.fetchRequest()
//                fetchRequest.predicate = NSPredicate(format: "label IN %@", labelsToFetch)
//                let existingChores = try context.fetch(fetchRequest)
//                for chore in existingChores {
//                    guard let label = chore.choreLabel,
//                    let representation = representationsByLabel[label] else { continue }
//                    chore.choreLabel = representation.choreName
//                    chore.choreIcon = representation.choreIcon
//                    chore.chorePointValue = Int16(representation.chorePointValue)
//                    chore.choreCompleted = representation.choreCompleted
//                    choresToCreate.removeValue(forKey: label)
//                }
//                for representation in choresToCreate.values {
//                        Chore(choreRepresentation: representation, context: context)
//                    }
//                    CoreDataStack.shared.save(context: context)
//            } catch {
//                NSLog("Error fetching chores from persistent store: \(error)")
//            }
//        }
//    }
    
    func updateChore(chore: Chore, completed: Bool) {
        guard let icon = chore.choreIcon,
            let label = chore.choreLabel else { return }
        chore.choreCompleted = completed
        let choreRep = ChoreRepresentation(choreIcon: icon,
                                           choreName: label,
                                           chorePointValue: chore.chorePointValue,
                                           choreCompleted: chore.choreCompleted,
                                           choreId: chore.choreId)
        guard let baseURL = baseURL else { return }
        AF.request("\(baseURL)/chores", method: .put, parameters: choreRep, encoder: JSONParameterEncoder.default).validate().response { response in
                debugPrint(response)
                CoreDataStack.shared.save()
        }
    }
    
    // MARK: - Isaac Networking
    
    func signIn(username: String, password: String, completion: @escaping (Error?) -> Void) {
        
        guard let baseURL = baseURL else {
            NSLog("Invalid base URL")
            completion(NSError())
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("api")
            .appendingPathComponent("auth")
            .appendingPathComponent("login")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let login = ["username": username, "password": password]
        
        do {
            let loginJSON = try JSONEncoder().encode(login)
            request.httpBody = loginJSON
        } catch {
            NSLog("Error encoding login data: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                NSLog("Error signing in: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from data task")
                completion(NSError())
                return
            }
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                
                let bearer = Bearer(token: loginResponse.token)
                self.bearer = bearer
                
                let user = User(id: loginResponse.userId, familyNameID: loginResponse.familyNameID, username: loginResponse.username, name: loginResponse.name, password: password)
                self.user = user
            } catch {
                NSLog("Error decoding login response: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
        }.resume()
        
    }
    
    func fetchChoresFromServer(completion: @escaping () -> Void = { }) {
        guard let baseURL = baseURL else {
            NSLog("Invalid base URL")
            completion()
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("api")
            .appendingPathComponent("chores")
        
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
                let chores = try JSONDecoder().decode([ChoreRepresentation].self, from: data)
                self.updateChores(with: chores)
            } catch {
                NSLog("Error decoding TaskRepresentations: \(error)")
            }
            
            completion()
        }.resume()
    }
    
    func updateChores(with representations: [ChoreRepresentation]) {
        
        let idsToFetch = representations.map({ $0.choreId })
        
        let representationsByID = Dictionary(uniqueKeysWithValues: zip(idsToFetch, representations))
        
        var choresToCreate = representationsByID
        let context = CoreDataStack.shared.container.newBackgroundContext()
        
        context.performAndWait {
            do {
                
                let fetchRequest: NSFetchRequest<Chore> = Chore.fetchRequest()
                
                fetchRequest.predicate = NSPredicate(format: "choreId IN %@", idsToFetch)
                
                let existingChores = try context.fetch(fetchRequest)
                
                for chore in existingChores {
                    let id = chore.choreId
                    
                    guard let representation = representationsByID[id] else { continue }
                    
                    chore.choreLabel = representation.choreName
                    chore.choreIcon = representation.choreIcon
                    chore.choreCompleted = representation.choreCompleted ?? false
                    chore.chorePointValue = representation.chorePointValue
                    
                    choresToCreate.removeValue(forKey: id)
                }
                
                for representation in choresToCreate.values {
                    Chore(choreRepresentation: representation, context: context)
                }
                
                CoreDataStack.shared.save(context: context)
            } catch {
                NSLog("Error fetching tasks from persistent store: \(error)")
            }
        }
        
    }
}
