//
//  LoginUITests.swift
//  Course MaterialsTests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest

final class LoginUITests: XCTestCase {

    func testLogin() throws {
		
		/// Set up the application and launch it.
        let app = XCUIApplication()
        app.launchWithTestEnvironment()
		
		let loginScreen = LoginScreen(app: app)
		loginScreen.login(username: "test@test.com", password: "testPassword123")
		
		let listView = app.otherElements["com.uitest.list.view"]
		let listViewFound = listView.waitForExistence(timeout: 2.0)
		
		// We use an assertion to ensure the view was found.
		XCTAssertTrue(listViewFound)
    }
}
