//
//  UITestSupport.swift
//  LOLChampionsUITests
//
//  Created by Ahmed Naser on 16/01/2022.
//

import Foundation
import XCTest

class APPUITestCase: XCTestCase {
    func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 5,
                                file: String = #file, line: UInt = #line) {
            let existsPredicate = NSPredicate(format: "exists == true")

        expectation(for: existsPredicate,
                       evaluatedWith: element, handler: nil)

        waitForExpectations(timeout: timeout) { (error) -> Void in
                if (error != nil) {
                    let message = "Failed to find \(element) after \(timeout) seconds."
                    let issue = XCTIssue(type: .assertionFailure, compactDescription: message)
                    self.record(issue)
                }
            }
        }
}
