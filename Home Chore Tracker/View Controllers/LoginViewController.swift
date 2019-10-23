//
//  LoginViewController.swift
//  Home Chore Tracker
//
//  Created by admin on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var choreLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    let orange = UIColor(red: 220.0, green: 150.0, blue: 10.0, alpha: 1.0)
    let blue = UIColor(red: 5.0, green: 85.0, blue: 150.0, alpha: 1.0)
    let green = UIColor(red: 5.0, green: 175.0, blue: 80.0, alpha: 1.0)
    
    let choreController = ChoreController()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    func updateViews() {
        
        choreLabel.backgroundColor = green
        choreLabel.layer.backgroundColor = green.cgColor
        choreLabel.layer.cornerRadius = 4
        choreLabel.textColor = .black
        
        userNameLabel.textColor = orange
        
        passwordLabel.textColor = orange
        
        loginButton.layer.backgroundColor = green.cgColor
        loginButton.layer.cornerRadius = 4

    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        guard let username = userNameTextField.text,
            let password = passwordTextField.text,
            !username.isEmpty,
            !password.isEmpty else { return }
        
        choreController.signIn(username: username, password: password) { error in
            if error != nil {
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Could not sign in", message: "There was an error signing in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                    
//                    self.dismiss(animated: true) {
//
//                        DispatchQueue.main.async {
//                            let alert = UIAlertController(title: "Logged in", message: "You have successfully logged in!", preferredStyle: .alert)
//                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                            self.present(alert, animated: true, completion: nil)
//                        }
//
//                    }
                }
                
            }
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
