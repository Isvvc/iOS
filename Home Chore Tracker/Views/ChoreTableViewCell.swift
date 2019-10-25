//
//  ChoreTableViewCell.swift
//  Home Chore Tracker
//
//  Created by Jerry Haaser on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ChoreTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var chore: Chore? {
        didSet {
            updateViews()
        }
    }
    //var choreController: ChoreController?
    
    // MARK: - Outlets
    
    @IBOutlet private weak var choreImageView: UIImageView!
    @IBOutlet private weak var choreNameLabel: UILabel!
    @IBOutlet private weak var pointsLabel: UILabel!

    // MARK: - Methods
    
    private func updateViews() {
        
        let blue = UIColor(red: 0.02, green: 0.33, blue: 0.59, alpha: 1.0)
        
        if let image = UIImage(named: chore?.choreIcon ?? "") {
            choreImageView.image = image
        }
        choreNameLabel.text = chore?.choreLabel?.capitalized
        choreNameLabel.textColor = blue
        
        if let points = chore?.chorePointValue {
            pointsLabel.text = "\(points) points"
            pointsLabel.textColor = blue
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
