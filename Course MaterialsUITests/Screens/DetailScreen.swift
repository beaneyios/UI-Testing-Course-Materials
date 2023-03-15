//
//  DetailScreen.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import Foundation
import XCTest

class DetailScreen {
	
	let app: XCUIApplication
	
	init(app: XCUIApplication) {
		self.app = app
	}
	
	func titleLabel() -> String {
		self.app.staticTexts["com.uitest.detail.title"].label
	}
	
	func subtitleLabel() -> String {
		self.app.staticTexts["com.uitest.detail.subtitle"].label
	}
	
	func actorLabel() -> String {
		self.app.staticTexts["com.uitest.detail.actors"].label
	}
	
	func runTimeLabel() -> String {
		self.app.staticTexts["com.uitest.detail.runTime"].label		
	}
	
	func waitForScreen() {
		
		let listView = app.otherElements["com.uitest.detail.view"]
		listView.waitForExistence(label: "Detail View")
	}
}
