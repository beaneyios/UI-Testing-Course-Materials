//
//  RequestFactory.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

struct RequestFactory {
	
	let baseUrl: String
	
	func request(
		for endpoint: Endpoint,
		method: HttpMethod = .get
	) throws -> URLRequest {
		
		guard let url = URL(string: "\(baseUrl)\(endpoint.path)") else {
			throw NetworkError.invalidUrl
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = method.rawValue
		return request
	}
}
