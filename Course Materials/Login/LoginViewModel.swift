//
//  LoginViewModel.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

protocol LoginPageDelegate: AnyObject {
	
	func loginPageDidLogIn()
}

class LoginViewModel {
	
	enum LoginState {
		case success
		case error(Error)
	}
	
	weak var delegate: LoginPageDelegate?
	
	var username: String = ""
	var password: String = ""
	
	let gateway: LoginGateway
	
	init(
		gateway: LoginGateway,
		delegate: LoginPageDelegate
	) {
		self.gateway = gateway
		self.delegate = delegate
	}
	
	@MainActor
	func login() {
		
		self.delegate?.loginPageDidLogIn()
		return;
		
		Task {
			do {
				let response = try await self.gateway.login(
					username: username,
					password: password
				)
				
				self.delegate?.loginPageDidLogIn()
			} catch {
				print(error)
			}
		}
	}
}
