//
//  ListUITests.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest

final class ListUITests: MockedUITests {

	func testList() throws {
		
		self.recordMode = false
		
		/// Set up the application and launch it.
		let app = XCUIApplication()
		app.launchWithTestEnvironment()
		
		// Create login screen and use it to login
		let loginScreen = LoginScreen(app: app)
		loginScreen.login(username: "test@test.com", password: "testPassword123")
		
		// Create list screen and use it to find elements on the screen
		let listScreen = ListScreen(app: app)
		listScreen.waitForScreen()
		
		self.verify(identifier: "List-View", app: app)
	}
}
