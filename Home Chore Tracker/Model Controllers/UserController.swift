//
//  UserController.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class UserController {
    
    init() {
        
    }
    
    let baseURL = URL(string: "https://bw3-homechoretracker.firebaseio.com/")!
    
    func fetchUsersFromServer(completion: @escaping () -> Void = { }) {
        let requestURL = baseURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
                   
               if let error = error {
                   NSLog("Error fetching users: \(error)")
                   completion()
               }
               
               guard let data = data else {
                   NSLog("No data returned from data task")
                   completion()
                   return
               }
               
               do {
                   let decoder = JSONDecoder()
                   
                   let userReprentations = try decoder.decode([String: UserRepresentation].self, from: data).map({ $0.value })
                   
                   //self.updateUsers(with: userReprentations)
                   
               } catch {
                   NSLog("Error decoding: \(error)")
               }
                   
        }.resume()
    }
}
