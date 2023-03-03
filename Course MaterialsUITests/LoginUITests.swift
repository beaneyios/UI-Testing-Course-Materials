//
//  LoginUITests.swift
//  Course MaterialsTests
//
//  Created by Matt Beaney on 03/03/2023.
//

import XCTest

final class LoginUITests: XCTestCase {

    func testLogin() throws {
		
		// Set up the application and launch it.
        let app = XCUIApplication()
        app.launch()
		
		// Find the username textfield on the screen and enter a password
		let usernameTextField = app.textFields["com.uitest.login.textfield.username"]
		usernameTextField.tap()
		usernameTextField.typeText("test@test.com")
		
		// Find the password field on the screen and enter a password
		let passwordTextField = app.secureTextFields["com.uitest.login.textfield.password"]
		passwordTextField.tap()
		passwordTextField.typeText("testPassword123")
		
		// Now tap the button
		let button = app.buttons["com.uitest.login.button"]
		button.tap()
    }
}

extension XCUIElement {
	
	func clearAndEnterText(text: String) {
		
		guard let stringValue = self.value as? String else {
			XCTFail("Tried to clear and enter text into a non string value")
			return
		}

		self.tap()

		let deleteString = String(
			repeating: XCUIKeyboardKey.delete.rawValue,
			count: stringValue.count
		)

		self.typeText(deleteString)
		self.typeText(text)
	}
}
