//
//  MockedUITest.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import XCTest
import Shock

class MockedUITests: XCTestCase {
	
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
	
	func configureMocks() {
		
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
