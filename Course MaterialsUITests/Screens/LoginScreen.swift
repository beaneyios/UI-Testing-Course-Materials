//
//  LoginScreen.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import Foundation
import XCTest

class LoginScreen {
	
	let app: XCUIApplication
	
	init(app: XCUIApplication) {
		self.app = app
	}
	
	func login(username: String, password: String) {
		
		/// Find the username textfield on the screen and enter a password
		let usernameTextField = self.app.textFields["com.uitest.login.textfield.username"]
		usernameTextField.tap()
		usernameTextField.typeText(username)
		
		/// Find the password field on the screen and enter a password
		let passwordTextField = self.app.secureTextFields["com.uitest.login.textfield.password"]
		passwordTextField.tap()
		passwordTextField.typeText(password)
		
		/// Now tap the button
		let button = app.buttons["com.uitest.login.button"]
		button.tap()
	}
}
