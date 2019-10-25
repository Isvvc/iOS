//
//  ChoreDetailViewController.swift
//  Home Chore Tracker
//
//  Created by Jerry Haaser on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ChoreDetailViewController: UIViewController {
    
    @IBOutlet weak var completedChoreLabel: UILabel!
    @IBOutlet private weak var choreImageView: UIImageView!
    @IBOutlet private weak var starView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    
    var chore: Chore?
    var choreController: ChoreController?
    var delegate: ChoreTableViewDelegate?
    
    let starImage = UIImage(named: "StarPoints")
    let orange = UIColor(red: 0.86, green: 0.59, blue: 0.04, alpha: 1.0)
    let blue = UIColor(red: 0.02, green: 0.33, blue: 0.59, alpha: 1.0)
    let green = UIColor(red: 0.02, green: 0.69, blue: 0.31, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        updateViews()
    }
    
    func updateViews() {
        guard let chore = chore, let choreLabel = chore.choreLabel else { return }
        title = choreLabel.capitalized
        completedChoreLabel.text = "Have you completed \(choreLabel)?"
        completedChoreLabel.textColor = .black
        choreImageView.image = UIImage(named: chore.choreIcon ?? "")
        starPoints()
        if chore.choreCompleted {
            doneButton.setTitle("Not Done", for: .normal)
        } else {
            doneButton.setTitle("Done", for: .normal)
        }
    }
        
    func starPoints() {
       guard let chore = chore else { return }
        let points = chore.chorePointValue
       switch points {
       case 1:
           oneStar()
       case 2:
           twoStars()
       case 3:
           threeStars()
       case 4:
           fourStars()
       default:
           fiveStars()
       }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        guard let chore = chore, let choreLabel = chore.choreLabel else { return }
        
        chore.choreCompleted.toggle()
        
        if chore.choreCompleted {
            let alert = UIAlertController(title: "Chore Completed!", message: "Good job on completing \(choreLabel), you've earned \(chore.chorePointValue) more points.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Chore Not Completed.", message: "You have not completed this chore.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
        }
        
        delegate?.updatePoints()
    }
}

extension ChoreDetailViewController {
    
    func oneStar() {
        let iV = UIImageView(image: starImage)
        iV.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        starView.addSubview(iV)
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV.heightAnchor.constraint(equalTo: iV.widthAnchor).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -35).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 35).isActive = true
        iV.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
    }
    
    func twoStars() {
        let iV = UIImageView(image: starImage)
        iV.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV2 = UIImageView(image: starImage)
        iV2.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        starView.addSubview(iV)
        starView.addSubview(iV2)
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV2.translatesAutoresizingMaskIntoConstraints = false
        iV.heightAnchor.constraint(equalTo: iV.widthAnchor).isActive = true
        iV.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -70).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true

        iV2.heightAnchor.constraint(equalTo: iV2.widthAnchor).isActive = true
        iV2.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV2.leadingAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV2.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 70).isActive = true
    }
    
    func threeStars() {
        let iV = UIImageView(image: starImage)
        iV.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV2 = UIImageView(image: starImage)
        iV2.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV3 = UIImageView(image: starImage)
        iV3.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        starView.addSubview(iV)
        starView.addSubview(iV2)
        starView.addSubview(iV3)
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV2.translatesAutoresizingMaskIntoConstraints = false
        iV3.translatesAutoresizingMaskIntoConstraints = false
        iV.heightAnchor.constraint(equalTo: iV.widthAnchor).isActive = true
        iV.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -35).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 35).isActive = true
        iV2.heightAnchor.constraint(equalTo: iV2.widthAnchor).isActive = true
        iV2.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV2.leadingAnchor.constraint(equalTo: iV.leadingAnchor, constant: -70).isActive = true
        iV2.trailingAnchor.constraint(equalTo: iV.leadingAnchor).isActive = true
        iV3.heightAnchor.constraint(equalTo: iV3.widthAnchor).isActive = true
        iV3.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV3.leadingAnchor.constraint(equalTo: iV.trailingAnchor).isActive = true
        iV3.trailingAnchor.constraint(equalTo: iV.trailingAnchor, constant: 70).isActive = true
    }
    
    func fourStars() {
        let iV = UIImageView(image: starImage)
        iV.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV2 = UIImageView(image: starImage)
        iV2.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV3 = UIImageView(image: starImage)
        iV3.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV4 = UIImageView(image: starImage)
        iV4.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        starView.addSubview(iV)
        starView.addSubview(iV2)
        starView.addSubview(iV3)
        starView.addSubview(iV4)
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV2.translatesAutoresizingMaskIntoConstraints = false
        iV3.translatesAutoresizingMaskIntoConstraints = false
        iV4.translatesAutoresizingMaskIntoConstraints = false
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV2.translatesAutoresizingMaskIntoConstraints = false
        iV.heightAnchor.constraint(equalTo: iV.widthAnchor).isActive = true
        iV.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -35).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV2.heightAnchor.constraint(equalTo: iV2.widthAnchor).isActive = true
        iV2.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV2.leadingAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV2.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 35).isActive = true
        iV3.heightAnchor.constraint(equalTo: iV3.widthAnchor).isActive = true
        iV3.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV3.leadingAnchor.constraint(equalTo: iV.leadingAnchor, constant: -70).isActive = true
        iV3.trailingAnchor.constraint(equalTo: iV.leadingAnchor).isActive = true
        iV4.heightAnchor.constraint(equalTo: iV4.widthAnchor).isActive = true
        iV4.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV4.leadingAnchor.constraint(equalTo: iV2.trailingAnchor).isActive = true
        iV4.trailingAnchor.constraint(equalTo: iV2.trailingAnchor, constant: 70).isActive = true
    }
    
    func fiveStars() {
        let iV = UIImageView(image: starImage)
        iV.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV2 = UIImageView(image: starImage)
        iV2.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV3 = UIImageView(image: starImage)
        iV3.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV4 = UIImageView(image: starImage)
        iV4.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let iV5 = UIImageView(image: starImage)
        iV5.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        starView.addSubview(iV)
        starView.addSubview(iV2)
        starView.addSubview(iV3)
        starView.addSubview(iV4)
        starView.addSubview(iV5)
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV2.translatesAutoresizingMaskIntoConstraints = false
        iV3.translatesAutoresizingMaskIntoConstraints = false
        iV4.translatesAutoresizingMaskIntoConstraints = false
        iV5.translatesAutoresizingMaskIntoConstraints = false
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV2.translatesAutoresizingMaskIntoConstraints = false
        iV3.translatesAutoresizingMaskIntoConstraints = false
        iV.heightAnchor.constraint(equalTo: iV.widthAnchor).isActive = true
        iV.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -35).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 35).isActive = true
        iV2.heightAnchor.constraint(equalTo: iV2.widthAnchor).isActive = true
        iV2.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV2.leadingAnchor.constraint(equalTo: iV.leadingAnchor, constant: -70).isActive = true
        iV2.trailingAnchor.constraint(equalTo: iV.leadingAnchor).isActive = true
        iV3.heightAnchor.constraint(equalTo: iV3.widthAnchor).isActive = true
        iV3.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV3.leadingAnchor.constraint(equalTo: iV.trailingAnchor).isActive = true
        iV3.trailingAnchor.constraint(equalTo: iV.trailingAnchor, constant: 70).isActive = true
        iV4.heightAnchor.constraint(equalTo: iV4.widthAnchor).isActive = true
        iV4.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV4.leadingAnchor.constraint(equalTo: iV2.leadingAnchor, constant: -70).isActive = true
        iV4.trailingAnchor.constraint(equalTo: iV2.leadingAnchor).isActive = true
        iV5.heightAnchor.constraint(equalTo: iV5.widthAnchor).isActive = true
        iV5.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        iV5.leadingAnchor.constraint(equalTo: iV3.trailingAnchor).isActive = true
        iV5.trailingAnchor.constraint(equalTo: iV3.trailingAnchor, constant: 70).isActive = true
    }
    
}
