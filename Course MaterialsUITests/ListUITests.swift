//
//  ListUITests.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest
import Shock

final class ListUITests: XCTestCase {
	
	var mockServer: MockServer!
	
	override func setUp() {
		super.setUp()
		self.mockServer = MockServer(
			port: 9000,
			bundle: Bundle(for: LoginUITests.self)
		)
		
		self.mockServer.start()
		self.configureMocks()
	}

	func testList() throws {
		
		/// Set up the application and launch it.
		let app = XCUIApplication()
		app.launchWithTestEnvironment()
		
		// Create login screen and use it to login
		let loginScreen = LoginScreen(app: app)
		loginScreen.login(username: "test@test.com", password: "testPassword123")
		
		// Create list screen and use it to find elements on the screen
		let listScreen = ListScreen(app: app)
		listScreen.waitForScreen()
		
		let firstTitleViewFound = listScreen.findCell(titled: "Beetlejuice")
		XCTAssertTrue(firstTitleViewFound)
		
		let secondTitleViewFound = listScreen.findCell(titled: "The Cotton Club")
		XCTAssertTrue(secondTitleViewFound)
		
		let thirdTitleViewFound = listScreen.findCell(titled: "The Shawshank Redemption")
		XCTAssertTrue(thirdTitleViewFound)
	}
	
	private func configureMocks() {
		
		let loginRoute: MockHTTPRoute = .simple(
			method: .get,
			urlPath: "/login.json",
			code: 200,
			filename: "login.json"
		)
				
		let listRoute: MockHTTPRoute = .simple(
			method: .get,
			urlPath: "/movies.json",
			code: 200,
			filename: "movies.json"
		)
		
		self.mockServer.setup(route: loginRoute)
		self.mockServer.setup(route: listRoute)
	}
}
