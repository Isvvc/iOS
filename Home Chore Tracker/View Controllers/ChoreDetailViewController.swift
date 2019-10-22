//
//  ChoreDetailViewController.swift
//  Home Chore Tracker
//
//  Created by Jerry Haaser on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ChoreDetailViewController: UIViewController {
    
    @IBOutlet private weak var completedChoreLabel: UILabel!
    @IBOutlet private weak var choreImageView: UIImageView!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var messageTextView: UITextView!
    
    var user: UserRepresentation?
    var child: ChildRepresentation?
    let starImage = UIImage(named: "StarPoints")

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        updateViews()
    }
    
    func updateViews() {
        
        title = "Chore.name"
        
        completedChoreLabel.text = "Have you completed Chore.name"
        completedChoreLabel.textColor = UIColor(displayP3Red: 5.0, green: 85.0, blue: 150.0, alpha: 1.0)
        
        //choreImageView.image = Chore.image
        
        messageTextView.text = ""
        messageTextView.textColor = .white
        messageTextView.layer.backgroundColor = CGColor(srgbRed: 5.0, green: 175.0, blue: 80.0, alpha: 1.0)
        
        doneButton.layer.cornerRadius = 4
        doneButton.layer.backgroundColor = CGColor(srgbRed: 5.0, green: 175.0, blue: 80.0, alpha: 1.0)
        
        
        
    }
    
    func starPoints() {
        guard let child = child else { return }
        
        let points = child.pointsEarned
        
        switch points {
        case 1:
            points == 1
            let iV = UIImageView(image: starImage)
            iV.translatesAutoresizingMaskIntoConstraints = false
            iV.centerXAnchor.constraint(equalTo: doneButton.centerXAnchor).isActive = true
            iV.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant:  -8).isActive = true
            view.addSubview(iV)
        case 2:
            points == 2
            let iV = UIImageView(image: starImage)
            let iV2 = UIImageView(image: starImage)
            iV.translatesAutoresizingMaskIntoConstraints = false
            iV2.translatesAutoresizingMaskIntoConstraints = false
            iV.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: -8).isActive = true
            iV.leadingAnchor.constraint(equalTo: doneButton.centerXAnchor, constant: -8).isActive = true
            iV.trailingAnchor.constraint(equalTo: doneButton.centerXAnchor).isActive = true
            iV2.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: -8).isActive = true
            iV2.leadingAnchor.constraint(equalTo: doneButton.centerXAnchor).isActive = true
            iV2.trailingAnchor.constraint(equalTo: doneButton.centerXAnchor, constant: 8).isActive = true
            
            
        case 3:
            points == 3
            
            
            
        case 4:
            points == 4
            
            
            
        default:
            points == 5
            
            
            
        }
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Chore Completed!", message: "Are you sure you have completed this chore?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
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
