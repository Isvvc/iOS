//
//  HomeChoreTrackerTests.swift
//  HomeChoreTrackerTests
//
//  Created by Ciara Beitel on 10/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Home_Chore_Tracker

class HomeChoreTrackerTests: XCTestCase {
    
    func testBaseURL() {
        let choreController = ChoreController()
        
        XCTAssertEqual("https://home-chore-tracker88.herokuapp.com", "\(choreController.baseURL!)")
    }
    
    func testDecodingGoodData() {
        do {
            let dataURL = Bundle.main.url(forResource: "GoodMockData", withExtension: "json")!
            let data = try Data(contentsOf: dataURL)
            let result = try JSONDecoder().decode(ChoreRepresentation.self, from: data)
            XCTAssertNoThrow(result)
        } catch {
            NSLog("Error")
        }
    }
    
    func testDecodingBadData() {
        do {
            let badDataURL = Bundle.main.url(forResource: "BadMockData", withExtension: "json")!
            let badData = try Data(contentsOf: badDataURL)
            let badDataResult = try JSONDecoder().decode(ChoreRepresentation.self, from: badData)
            XCTAssertThrowsError(badDataResult)
        } catch {
            NSLog("Error")
        }
    }
    
    func testNumberOfSections() {
        let choreTableViewController = ChoreTableViewController()
        let sectionInfo = choreTableViewController.fetchedResultsController.sections
        let numberOfSections = sectionInfo?.count
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testNumberOfRows() {
        let choreTableViewController = ChoreTableViewController()
        let sectionInfo = choreTableViewController.fetchedResultsController.sections
        let numberOfRows = sectionInfo?.compactMap { $0.numberOfObjects }
        XCTAssertEqual(numberOfRows, [3])
    }
}
