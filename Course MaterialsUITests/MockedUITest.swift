//
//  MockedUITest.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import XCTest
import Shock
import iOSSnapshotTestCase

class MockedUITests: FBSnapshotTestCase {
	
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

// Snapshot testing
extension MockedUITests {
	
	func verify(
		identifier: String,
		app: XCUIApplication,
		file: StaticString = #file,
		line: UInt = #line
	) {
		
		guard let croppedImage = app.screenshot().image.removingStatusBar else {
			
			XCTFail(
				"An error occurred while cropping the screenshot",
				file: file,
				line: line
			)
			
			return
		}
		
		let imageView = UIImageView(image: croppedImage)
		
		FBSnapshotVerifyView(
			imageView,
			identifier: "\(Self.self)-\(identifier)",
			overallTolerance: 0.0
		)
	}
}
