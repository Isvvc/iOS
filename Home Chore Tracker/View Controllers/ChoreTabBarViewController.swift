//
//  ChoreTabBarViewController.swift
//  Home Chore Tracker
//
//  Created by Isaac Lyons on 10/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ChoreTabBarViewController: UITabBarController {
    
    var choreController = ChoreController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if choreController.bearer == nil {
            self.performSegue(withIdentifier: "ShowLoginSegue", sender: self)
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let loginVC = segue.destination as? LoginViewController {
            loginVC.choreController = choreController
        }
    }

}
