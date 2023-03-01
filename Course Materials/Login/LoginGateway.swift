//
//  LoginGateway.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

struct LoginGateway {
	
	let requestFactory: RequestFactory
	let networkManager: NetworkManager
	
	func login(username: String, password: String) async throws -> LoginResponse {
		
		let loginRequest = LoginRequest(username: username, password: password)
		let request = try requestFactory.request(
			for: .login(loginRequest),
			method: .get
		)
		
		return try await self.networkManager.performRequest(request)
	}
}
