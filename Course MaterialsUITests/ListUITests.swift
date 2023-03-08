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
		
		let loginScreen = LoginScreen(app: app)
		loginScreen.login(username: "test@test.com", password: "testPassword123")
		
		/** Now we just need to wait for the list view to appear.
			**NOTE**: See how we're applying a generous timeout of 2 seconds?
			That's to allow for the network request to complete.
			More on that in a later chapter.
		*/
		let listView = app.otherElements["com.uitest.list.view"]
		let listViewFound = listView.waitForExistence(timeout: 2.0)
		
		// We use an assertion to ensure the view was found.
		XCTAssertTrue(listViewFound)
		
		// Look for the first few cells to make sure they are rendering
		let firstTitle = app.staticTexts["Beetlejuice"]
		let firstTitleViewFound = firstTitle.waitForExistence(timeout: 2.0)
		XCTAssertTrue(firstTitleViewFound)
		
		let secondTitle = app.staticTexts["The Cotton Club"]
		let secondTitleViewFound = secondTitle.waitForExistence(timeout: 2.0)
		XCTAssertTrue(secondTitleViewFound)
		
		let thirdTitle = app.staticTexts["The Shawshank Redemption"]
		let thirdTitleViewFound = thirdTitle.waitForExistence(timeout: 2.0)
		XCTAssertTrue(thirdTitleViewFound)
		
		/// NOTE: Lots of code repetition here. This will be tackled in the next chapter.
	}
}
