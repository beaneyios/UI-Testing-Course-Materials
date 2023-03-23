//
//  LoginUITests.swift
//  Course MaterialsTests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest
import Shock

final class LoginUITests: XCTestCase {
	
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

    func testLogin() throws {

		/// Set up the application and launch it.
        let app = XCUIApplication()
        app.launchWithTestEnvironment()
		
		let loginScreen = LoginScreen(app: app)
		loginScreen.login(username: "test@test.com", password: "testPassword123")
		
		let listView = app.otherElements["com.uitest.list.view"]
		let listViewFound = listView.waitForExistence(timeout: 30.0)
		
		// We use an assertion to ensure the view was found.
		XCTAssertTrue(listViewFound)
    }
	
	private func configureMocks() {
		
		let route: MockHTTPRoute = .simple(
			method: .get,
			urlPath: "/login.json",
			code: 200,
			filename: "login.json"
		)
		
		self.mockServer.setup(route: route)
	}
}
