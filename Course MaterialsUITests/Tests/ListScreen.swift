//
//  ListScreen.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import Foundation
import XCTest

class ListScreen {
	
	let app: XCUIApplication
	
	init(app: XCUIApplication) {
		self.app = app
	}
	
	func findCell(titled title: String) -> Bool {
		let firstTitle = self.app.staticTexts[title]
		return firstTitle.waitForExistence(timeout: 2.0)
	}
	
	func cell(forId id: String) -> XCUIElement {
		self.app.buttons["com.uitest.cell.\(id)"]
	}
	
	func waitForScreen() -> Bool {
		
		let listView = app.otherElements["com.uitest.list.view"]
		return listView.waitForExistence(timeout: 2.0)
	}
}
