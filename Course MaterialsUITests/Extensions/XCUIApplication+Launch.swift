//
//  XCUIApplication+Launch.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import XCTest

extension XCUIApplication {
	
	func launchWithTestEnvironment() {
		self.configure()
		self.launch()
	}
	
	func configure() {
		
		launchEnvironment = [
			"isUITest": "true"
		]
	}
}
