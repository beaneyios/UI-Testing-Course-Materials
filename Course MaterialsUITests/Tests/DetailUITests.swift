//
//  DetailUITests.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest

final class DetailUITests: XCTestCase {

	func testDetail() throws {
		
		/// Set up the application and launch it.
		let app = XCUIApplication()
		app.launch()
		
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
		
		XCTAssertEqual(detailScreen.titleLabel(), "Beetlejuice")
		XCTAssertEqual(
			detailScreen.subtitleLabel(),
			"A couple of recently deceased ghosts contract the services of a \"bio-exorcist\" in order to remove the obnoxious new owners of their house."
		)
		XCTAssertEqual(detailScreen.actorLabel(), "Alec Baldwin, Geena Davis, Annie McEnroe, Maurice Page")
		XCTAssertEqual(detailScreen.runTimeLabel(), "92")
	}
}
