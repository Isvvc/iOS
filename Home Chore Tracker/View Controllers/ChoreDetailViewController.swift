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
    @IBOutlet weak var starView: UIView!
    
    var user: UserRepresentation?
    var chore: Chore?
    var choreController: ChoreController?
    let starImage = UIImage(named: "StarPoints")
    let orange = UIColor(red:0.86, green:0.59, blue:0.04, alpha:1.0)
    let blue = UIColor(red:0.02, green:0.33, blue:0.59, alpha:1.0)
    let green = UIColor(red:0.02, green:0.69, blue:0.31, alpha:1.0)
    let points = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        updateViews()
        starPoints()
    }
    
    func updateViews() {
        
        title = chore?.choreLabel
        
        completedChoreLabel.text = "Have you completed \(String(describing: chore?.choreLabel))"
        completedChoreLabel.textColor = UIColor(red:0.02, green:0.69, blue:0.31, alpha:1.0)
        
        //choreImageView.image = chore?.choreIcon
        
        addButtonBackground(theButton: doneButton)
        starPoints()
    }
    
    func addButtonBackground(theButton: UIButton) {
        let button = theButton
        view.addSubview(button)
        button.layer.borderColor = green.cgColor
        button.layer.borderWidth = 1
        button.layer.backgroundColor = green.cgColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
    
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

extension ChoreDetailViewController {
    
    func oneStar() {
        let iV = UIImageView(image: starImage)
        iV.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        starView.addSubview(iV)
        iV.translatesAutoresizingMaskIntoConstraints = false
        //iV.centerXAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV.topAnchor.constraint(equalTo: starView.topAnchor).isActive = true
        iV.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -35).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 35).isActive = true

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
        iV.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -70).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV2.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV2.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
        //iV.centerXAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //iV.widthAnchor.constraint(equalToConstant: 10).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -35).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 35).isActive = true
        iV2.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV2.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV2.leadingAnchor.constraint(equalTo: iV.leadingAnchor, constant: -70).isActive = true
        iV2.trailingAnchor.constraint(equalTo: iV.leadingAnchor).isActive = true
        iV3.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV3.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
        iV.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -35).isActive = true
        //iV.widthAnchor.constraint(equalToConstant: 10).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV2.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV2.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV2.leadingAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV2.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 35).isActive = true
        iV3.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV3.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV3.leadingAnchor.constraint(equalTo: iV.leadingAnchor, constant: -70).isActive = true
        iV3.trailingAnchor.constraint(equalTo: iV.leadingAnchor).isActive = true
        iV4.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV4.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
        //iV.centerXAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        iV.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //iV.widthAnchor.constraint(equalToConstant: 10).isActive = true
        iV.leadingAnchor.constraint(equalTo: starView.centerXAnchor, constant: -35).isActive = true
        iV.trailingAnchor.constraint(equalTo: starView.centerXAnchor, constant: 35).isActive = true
        iV2.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV2.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV2.leadingAnchor.constraint(equalTo: iV.leadingAnchor, constant: -70).isActive = true
        iV2.trailingAnchor.constraint(equalTo: iV.leadingAnchor).isActive = true
        iV3.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV3.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV3.leadingAnchor.constraint(equalTo: iV.trailingAnchor).isActive = true
        iV3.trailingAnchor.constraint(equalTo: iV.trailingAnchor, constant: 70).isActive = true
        iV4.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV4.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV4.leadingAnchor.constraint(equalTo: iV2.leadingAnchor, constant: -70).isActive = true
        iV4.trailingAnchor.constraint(equalTo: iV2.leadingAnchor).isActive = true
        iV5.topAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.topAnchor).isActive = true
        iV5.bottomAnchor.constraint(equalTo: starView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        iV5.leadingAnchor.constraint(equalTo: iV3.trailingAnchor).isActive = true
        iV5.trailingAnchor.constraint(equalTo: iV3.trailingAnchor, constant: 70).isActive = true

    }
    
}
