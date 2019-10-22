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
    
    let chore: Chore? = nil
    let choreController: ChoreController? = nil
    
    // MARK: - Outlets
    
    @IBOutlet private weak var choreImageView: UIImageView!
    @IBOutlet private weak var choreNameLabel: UILabel!
    @IBOutlet private weak var pointsLabel: UILabel!

    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateViews()
    }
    
    func updateViews() {
        
//        choreImageView.image = chore.image

//        choreNameLabel.text = chore.name
        choreNameLabel.textColor = UIColor(displayP3Red: 5.0, green: 85.0, blue: 150.0, alpha: 1.0)
        
//        pointsLabel.text = "\(chore.points) points"
        pointsLabel.textColor = UIColor(displayP3Red: 5.0, green: 85.0, blue: 150.0, alpha: 1.0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
