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
                //self.updateChores(with: choreRepresentations)
            } catch {
                NSLog("Error decoding: \(error)")
            }
            completion(nil)
            debugPrint("Response: \(response)")
        }
    }
}
