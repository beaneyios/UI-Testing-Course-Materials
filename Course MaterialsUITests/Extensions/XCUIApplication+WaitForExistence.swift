//
//  XCUIElement+WaitForExistence.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import XCTest
import Foundation

extension XCUIApplication {
	
	func wait(
		for element: XCUIElement,
		label: String,
		timeout: TimeInterval = 2.0,
		file: StaticString = #file,
		line: UInt = #line
	) {
		
		if !element.waitForExistence(timeout: timeout) {
			XCTFail("Unable to find \(label)")
			self.takeScreenshot(name: "could-not-find-element-\(label)")
		}
	}
}
