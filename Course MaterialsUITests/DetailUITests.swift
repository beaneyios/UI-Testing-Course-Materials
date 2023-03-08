//
//  DetailUITests.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest

final class DetailUITests: MockedUITests {

	func testDetail() throws {
		
		self.recordMode = false
		
		/// Set up the application and launch it.
		let app = XCUIApplication()
		app.launchWithTestEnvironment()
		
		// Create login screen and use it to login
		let loginScreen = LoginScreen(app: app)
		loginScreen.login(username: "test@test.com", password: "testPassword123")

		// Create login screen and use it to navigate to the detail view
		let listScreen = ListScreen(app: app)
		listScreen.waitForScreen()

		let cell = listScreen.cell(forId: "1")
		cell.tap()
		
		// Create detail screen and use it to find elements for testing
		let detailScreen = DetailScreen(app: app)
		detailScreen.waitForScreen()
		
		self.verify(identifier: "Detail-View", app: app)
	}
}
