//
//  ListUITests.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest

final class ListUITests: MockedUITests {

	@MainActor
	func testList() async throws {
		
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
		
		// Send a websocket message
		try await MockServerHandler.pushWebsocket(
			fixtureName: "movies-socket-message"
		)
		
		// Allow the websocket message to fire and be received by the app.
		// If we weren't using snapshot, we could just "wait" for the cell to update
		// with assertions.
		sleep(1)
		
		self.verify(identifier: "List-View-Websocket", app: app)
	}
}
