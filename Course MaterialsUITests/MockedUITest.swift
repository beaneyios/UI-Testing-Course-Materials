//
//  MockedUITest.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import XCTest
import iOSSnapshotTestCase

class MockedUITests: FBSnapshotTestCase {
	
	override func setUp() async throws {
		
		try await self.configureMocks()
	}
	
	override func tearDown() async throws {
		
		try await MockServerHandler.cleanUp()
	}
	
	func configureMocks() async throws {
		
		try await MockServerHandler.pushBody(
			fixtureName: "login",
			path: "login.json"
		)
		
		try await MockServerHandler.pushBody(
			fixtureName: "movies",
			path: "movies.json"
		)
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
			overallTolerance: 0.05,
			file: file,
			line: line
		)
	}
}
