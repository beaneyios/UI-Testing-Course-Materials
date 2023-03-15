//
//  ListUITests.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest

final class ListUITests: XCTestCase {

	func testList() throws {
		
		/// Set up the application and launch it.
		let app = XCUIApplication()
		app.launch()
		
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
}
