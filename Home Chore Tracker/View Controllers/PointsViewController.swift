//
//  PointsViewController.swift
//  Home Chore Tracker
//
//  Created by Isaac Lyons on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PointsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var pointsEarnedLabel: UILabel!
    @IBOutlet private weak var pointsContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        updateViews()
    }
    
    // MARK: - Private
    
    private func updateViews() {
        
        let highlightColor = UIColor(red: 0.86, green: 0.59, blue: 0.04, alpha: 1.0)
        
        pointsContainerView.backgroundColor = highlightColor
        pointsContainerView.layer.cornerRadius = 10
        
        pointsLabel.textColor = .white
        pointsEarnedLabel.textColor = .white
        
    }

}
