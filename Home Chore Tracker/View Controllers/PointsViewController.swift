//
//  PointsViewController.swift
//  Home Chore Tracker
//
//  Created by Isaac Lyons on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class PointsViewController: UIViewController {
    
    var choreController: ChoreController!
    
    // MARK: - Outlets
    
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var pointsEarnedLabel: UILabel!
    @IBOutlet private weak var pointsContainerView: UIView!
    
    lazy var fetchedResultsController: NSFetchedResultsController<Chore> = {
        
        let fetchRequest: NSFetchRequest<Chore> = Chore.fetchRequest()
        
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "choreCompleted", ascending: true)
        ]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: CoreDataStack.shared.mainContext,
                                             sectionNameKeyPath: "choreCompleted",
                                             cacheName: nil)
        
        do {
            try frc.performFetch()
        } catch {
            fatalError("Error performing fetch for frc: \(error)")
        }
        
        return frc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        updateViews()
    }
    
    // MARK: - Private
    
    func updateViews() {
        if isViewLoaded {
            let highlightColor = UIColor(red: 0.86, green: 0.59, blue: 0.04, alpha: 1.0)
            
            pointsContainerView.backgroundColor = highlightColor
            pointsContainerView.layer.cornerRadius = 10
            
            if let completedChores = fetchedResultsController.fetchedObjects {
                var total: Int16 = 0
                
                for chore in completedChores {
                    if chore.choreCompleted {
                        total += chore.chorePointValue
                    }
                }
                
                pointsLabel.text = "\(total)"
            }
            
            pointsLabel.textColor = .white
            pointsEarnedLabel.textColor = .white
        }
    }

}
