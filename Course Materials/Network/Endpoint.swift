//
//  Endpoint.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

enum Endpoint {
	
	case movieList
	case login(LoginRequest)
	
	var path: String {
		
		switch self {
		case .movieList:
			return "/movies.json"
		case .login(_):
			return "/login.json"
		}
	}
	
	var body: Data? {
		
		return nil;
		
		switch self {
		case let .login(request):			
			let jsonEncoder = JSONEncoder()
			return try? jsonEncoder.encode(request)
		default:
			return nil
		}
	}
}
