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
		
		let loginScreen = LoginScreen(app: app)
		loginScreen.login(username: "test@test.com", password: "testPassword123")
		
		/** Now we just need to wait for the list view to appear.
			**NOTE**: See how we're applying a generous timeout of 2 seconds?
			That's to allow for the network request to complete.
			More on that in a later chapter.
		*/
		let listView = app.otherElements["com.uitest.list.view"]
		_ = listView.waitForExistence(timeout: 2.0)
				
		let cell = app.buttons["com.uitest.cell.1"]
		cell.tap()
		
		let detailView = app.otherElements["com.uitest.detail.view"]
		let detailViewFound = detailView.waitForExistence(timeout: 2.0)
		XCTAssertTrue(detailViewFound)
		
		let title = app.staticTexts["com.uitest.detail.title"]
		XCTAssertEqual(title.label, "Beetlejuice")
		
		let subtitle = app.staticTexts["com.uitest.detail.subtitle"]
		XCTAssertEqual(subtitle.label, "A couple of recently deceased ghosts contract the services of a \"bio-exorcist\" in order to remove the obnoxious new owners of their house.")
		
		let actors = app.staticTexts["com.uitest.detail.actors"]
		XCTAssertEqual(actors.label, "Alec Baldwin, Geena Davis, Annie McEnroe, Maurice Page")
		
		let runTime = app.staticTexts["com.uitest.detail.runTime"]
		XCTAssertEqual(runTime.label, "92")
	}
}
