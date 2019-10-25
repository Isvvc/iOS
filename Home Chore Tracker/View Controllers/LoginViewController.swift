//
//  LoginViewController.swift
//  Home Chore Tracker
//
//  Created by admin on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import CoreGraphics

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var choreLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    let orange = UIColor(red: 0.86, green: 0.59, blue: 0.04, alpha: 1.0)
    let blue = UIColor(red: 0.02, green: 0.33, blue: 0.59, alpha: 1.0)
    let green = UIColor(red: 0.02, green: 0.69, blue: 0.31, alpha: 1.0)
    
    var choreController: ChoreController!
    
    var onComplete: [( () -> Void )] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func updateViews() {
        
        addLabelBackground(theLabel: choreLabel)
//        addLabelBackground(theLabel: userNameLabel)
//        addLabelBackground(theLabel: passwordLabel)
        addButtonBackground(theButton: loginButton)
        userNameLabel.textColor = blue
        passwordLabel.textColor = blue

    }
    
    func addLabelBackground(theLabel: UILabel) {
        let label = theLabel
        view.addSubview(label)
        label.textColor = .white
        label.layer.borderColor = orange.cgColor
        label.layer.borderWidth = 1
        label.layer.backgroundColor = orange.cgColor
        label.layer.cornerRadius = 10
        
    }
    
    func addButtonBackground(theButton: UIButton) {
        let button = theButton
        view.addSubview(button)
        button.layer.borderColor = green.cgColor
        button.layer.borderWidth = 1
        button.layer.backgroundColor = green.cgColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
    
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        guard let username = userNameTextField.text,
            let password = passwordTextField.text,
            !username.isEmpty,
            !password.isEmpty else { return }
        
        choreController.signIn(username: username, password: password) { error in
            if error != nil {
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Could not log in", message: "There was an error logging in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                
                DispatchQueue.main.async {
                    
                    for callback in self.onComplete {
                        callback()
                    }
                    
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            return true
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            return true
        } else {
            return false
        }
    }
}
