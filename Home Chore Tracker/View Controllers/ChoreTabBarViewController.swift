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

        if let viewControllers = viewControllers {
            for vc in viewControllers {
                if let choreTableVC = vc as? ChoreTableViewController {
                    choreTableVC.choreController = choreController
                } else if let profileVC = vc as? ProfileViewController {
                    profileVC.choreController = choreController
                } else if let pointsVC = vc as? PointsViewController {
                    pointsVC.choreController = choreController
                }
            }
        }
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
