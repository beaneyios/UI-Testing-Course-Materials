//
//  XCUIElement+WaitForExistence.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import XCTest
import Foundation

extension XCUIElement {
	
	func waitForExistence(
		label: String,
		timeout: TimeInterval = 2.0,
		file: StaticString = #file,
		line: UInt = #line
	) {
		
		if !self.waitForExistence(timeout: timeout) {
			XCTFail("Unable to find \(label)")
		}
	}
}
