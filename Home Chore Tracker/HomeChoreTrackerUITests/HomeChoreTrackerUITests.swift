//
//  HomeChoreTrackerUITests.swift
//  HomeChoreTrackerUITests
//
//  Created by Ciara Beitel on 10/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Home_Chore_Tracker

class HomeChoreTrackerUITests: XCTestCase {
    
    var app: XCUIApplication!
    //var choreController = ChoreController()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
//    func testCompletedChoreButtonTapped() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let viewController = storyboard
//            .instantiateViewController(withIdentifier: "ChoreDetailStoryboardID") as? ChoreDetailViewController else { return }
//        _ = viewController.view
//        let chore = Chore(choreId: 1, choreIcon: "", choreLabel: "Chore 1", chorePointValue: 4, choreCompleted: false, context: CoreDataStack.shared.mainContext)
//        guard let choreLabel = chore.choreLabel else { return }
//        XCTAssertEqual("Have you completed \(choreLabel)?", viewController.completedChoreLabel!.text!)
//    }
    
//    func testLoginButton() {
//
//    }
    
}
